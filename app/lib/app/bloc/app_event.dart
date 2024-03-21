part of 'app_bloc.dart';

abstract class AppEvent extends BaseAppEvent {
  const AppEvent();
}

class AppInitiated extends AppEvent {
  const AppInitiated();
}

class AppThemeChanged extends AppEvent {
  final ThemeMode themeMode;
  const AppThemeChanged({required this.themeMode});
}
