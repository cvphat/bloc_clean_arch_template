part of 'home_bloc.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  const factory HomeState({
    @Default(0) int count,
  }) = _HomeState;
}
