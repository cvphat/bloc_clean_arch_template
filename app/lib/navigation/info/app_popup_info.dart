import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'app_popup_info.freezed.dart';

@freezed
class AppPopupInfo extends BasePopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.confirmDialog({
    @Default('') String message,
    Function? onPressed,
  }) = _ConfigmDialog;
}
