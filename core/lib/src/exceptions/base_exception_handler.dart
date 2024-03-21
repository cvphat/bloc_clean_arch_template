part of 'exceptions.dart';

abstract class BaseExceptionHandler {
  BaseNavigator? _navigator;
  ExceptionListener? _listener;

  BaseNavigator get navigator => _navigator!;
  ExceptionListener get listener => _listener!;

  void initialize({
    required BaseNavigator navigator,
    required ExceptionListener listener,
  }) {
    _navigator ??= navigator;
    _listener ??= listener;
  }

  Future<void> handleException(
    ExceptionWrapper exceptionWrapper,
    String exceptionMessage,
  );
}
