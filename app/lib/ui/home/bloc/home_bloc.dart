import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_bloc.freezed.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<Plus1Emitted>(
      plus1,
      transformer: log(),
    );
  }

  Future<void> plus1(Plus1Emitted event, emit) async {
    return await runBlocCatching(
      action: () async {
        await Future.delayed(const Duration(seconds: 5));
        emit(state.copyWith(count: state.count + 1));
        throw AppUncaughtException('Error with count ${state.count}');
      },
    );
  }
}
