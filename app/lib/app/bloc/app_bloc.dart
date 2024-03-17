import 'package:bloc_clean_arch/bloc_clean_arch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@singleton
class AppBloc extends BaseAppBloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    // TODO: event here
  }
}
