import 'dart:async';

import 'package:core/core.dart';
import 'package:core/src/usecase/base/base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final BaseNavigator navigator = GetIt.instance.get<BaseNavigator>();
  late final BaseAppBloc appBloc;
  late final DisposeBag disposeBag;
  late final BaseExceptionHandler exceptionHandler;
  late final BaseExceptionMapper exceptionMapper;

  late final BaseClearUserDataUseCase _clearUserDataUseCase =
      GetIt.instance.isRegistered<BaseClearUserDataUseCase>()
          ? GetIt.instance.get<BaseClearUserDataUseCase>()
          : FakeClearUserDataUseCase();
  late final CommonBloc _commonBloc = CommonBloc(_clearUserDataUseCase)
    ..disposeBag = disposeBag
    ..exceptionHandler = exceptionHandler
    ..exceptionMapper = exceptionMapper;

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e('Cannot add new event $event because $runtimeType was closed');
    }
  }

  Future<void> addException(ExceptionWrapper exceptionWrapper) async {
    commonBloc.add(
      ExceptionEmitted(
        exceptionWrapper: exceptionWrapper,
      ),
    );

    return exceptionWrapper.exceptionCompleter?.future;
  }

  void showLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  Future<void> runBlocCatching({
    required Future<void> Function() action,
    Future<void> Function()? doOnRetry,
    Future<void> Function(BaseException)? doOnError,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = true,
    bool handleRetry = true,
    bool Function(BaseException)? forceHandleError,
    String? overrideErrorMessage,
    int? maxRetries,
  }) async {
    assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');
    Completer<void>? recursion;
    try {
      await doOnSubscribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
    } on BaseException catch (e) {
      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
      await doOnError?.call(e);

      if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
        await addException(
          ExceptionWrapper(
            appException: e,
            doOnRetry: doOnRetry ??
                (handleRetry && maxRetries != 1
                    ? () async {
                        recursion = Completer();
                        await runBlocCatching(
                          action: action,
                          doOnEventCompleted: doOnEventCompleted,
                          doOnSubscribe: doOnSubscribe,
                          doOnSuccessOrError: doOnSuccessOrError,
                          doOnError: doOnError,
                          doOnRetry: doOnRetry,
                          forceHandleError: forceHandleError,
                          handleError: handleError,
                          handleLoading: handleLoading,
                          handleRetry: handleRetry,
                          overrideErrorMessage: overrideErrorMessage,
                          maxRetries: maxRetries?.minus(1),
                        );
                        recursion?.complete();
                      }
                    : null),
            exceptionCompleter: Completer<void>(),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }

  bool _forceHandleError(BaseException appException) {
    return appException is RemoteException &&
        appException.kind == RemoteExceptionKind.refreshTokenFailed;
  }
}
