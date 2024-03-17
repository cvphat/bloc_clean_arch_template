part of 'app_bloc.dart';

@freezed
class AppState extends BaseAppState with _$AppState {
  const factory AppState({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppState;
}
