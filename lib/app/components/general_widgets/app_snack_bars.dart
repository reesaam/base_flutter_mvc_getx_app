import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core_functions.dart';
import '../../../core/core_widgets.dart';
import '../../../data/info/app_defaults.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../buttons/app_general_button.dart';
import '../buttons/app_icon_button.dart';

class AppSnackBar {
  showSnackBar({
    required String message,
    String? title,
    Function()? leadingAction,
    Icon? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
  }) {
    GetSnackBar(
      titleText: title == null ? shrinkSizedBox : Text(title),
      messageText: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(message),
        buttonText == null
            ? shrinkSizedBox
            : Column(children: [
                AppSpaces.h20,
                AppGeneralButton(text: buttonText, primaryColor: true, onTap: buttonAction ?? nullFunction),
              ]),
      ]),
      mainButton: leadingIcon == null
          ? null
          : leadingText == null
              ? AppIconButton(
                  primaryColor: true,
                  icon: leadingIcon,
                  onTap: leadingAction ?? nullFunction,
                )
              : _buttonWidget(leadingAction ?? nullFunction, leadingText),
      padding: AppPaddings.snackBar,
      snackPosition: appDefaultSnackPosition,
      snackStyle: SnackStyle.FLOATING,
      animationDuration: appSnackBarDefaultAnimationDuration,
      duration: appSnackBarDefaultDuration,
      isDismissible: true,
    ).show();
  }

  Widget _buttonWidget(Function() buttonFunction, String buttonText) => AppGeneralButton(text: buttonText, onTap: buttonFunction);
}
