import 'package:app/navigation/info/app_popup_info.dart';
import 'package:app/ui/common_view/popup/common_dialog.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:core/core.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(BasePopupInfo popupInfo, BaseNavigator navigator) {
    switch (popupInfo) {
      case AppPopupInfo appPopupInfo:
        return appPopupInfo.when(
          confirmDialog: (message, onPressed) {
            return CommonDialog(
              message: message,
            );
          },
        );
      default:
        throw const AppUncaughtException('PopupInfo not found');
    }
  }
}
