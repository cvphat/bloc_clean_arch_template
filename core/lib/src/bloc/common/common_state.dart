part of 'common_bloc.dart';

class CommonState extends BaseBlocState {
  final ExceptionWrapper? exceptionWrapper;
  final int loadingCount;
  final bool isLoading;
  const CommonState({
    this.exceptionWrapper,
    this.isLoading = false,
    this.loadingCount = 0,
  });

  CommonState copyWith({
    ExceptionWrapper? exceptionWrapper,
    bool? isLoading,
    int? loadingCount,
  }) {
    return CommonState(
      exceptionWrapper: exceptionWrapper ?? this.exceptionWrapper,
      loadingCount: loadingCount ?? this.loadingCount,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
