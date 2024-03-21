part of 'common_bloc.dart';

abstract class CommonEvent extends BaseBlocEvent {
  const CommonEvent();
}

class ExceptionEmitted extends CommonEvent {
  final ExceptionWrapper exceptionWrapper;
  const ExceptionEmitted({required this.exceptionWrapper});
}

class LoadingVisibilityEmitted extends CommonEvent {
  final bool isLoading;
  const LoadingVisibilityEmitted({required this.isLoading});
}

class ForceLogoutButtonPressed extends CommonEvent {}
