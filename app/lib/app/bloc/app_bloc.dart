import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@singleton
class AppBloc extends BaseAppBloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitiated>(_onAppInitiated);

    on<AppThemeChanged>(_onAppThemeChanged);
  }

  Future<void> _onAppInitiated(
      AppInitiated event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        // final output = _getInitialAppDataUseCase.execute(const GetInitialAppDataInput());
        // _updateThemeSetting(output.isDarkMode);
        // emit(state.copyWith(
        //   isDarkTheme: output.isDarkMode,
        //   isLoggedIn: output.isLoggedIn,
        //   languageCode: output.languageCode,
        // ));
      },
    );
  }

  Future<void> _onAppThemeChanged(
      AppThemeChanged event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        // await _saveIsDarkModeUseCase.execute(SaveIsDarkModeInput(isDarkMode: event.isDarkTheme));
        // _updateThemeSetting(event.isDarkTheme);
        // emit(state.copyWith(isDarkTheme: event.isDarkTheme));
      },
    );
  }
}
