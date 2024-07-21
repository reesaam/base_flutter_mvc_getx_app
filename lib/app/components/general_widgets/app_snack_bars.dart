import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../core/core_widgets.dart';
import '../../../data/info/app_defaults.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../data/resources/app_text_styles.dart';
import '../buttons/app_general_button.dart';
import '../buttons/app_icon_button.dart';

class AppSnackBar {
  showSnackBar({required String message, String? title, VoidCallback? leadingAction, String? leadingText, VoidCallback? buttonAction, Icon? leadingIcon, String? buttonText}) {
    GetSnackBar(
      titleText: title == null ? shrinkSizedBox : Text(title, style: AppTextStyles.snackBarTitle),
      messageText: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Text(message, style: AppTextStyles.snackBarMessage),
        buttonText != null
            ? Column(children: [
                AppSpaces.h20,
                AppGeneralButton(text: buttonText, lightButton: true, onTap: buttonAction ?? () {}),
              ])
            : shrinkSizedBox
      ]),
      mainButton: leadingIcon != null
          ? CircleAvatar(backgroundColor: AppColors.appBackground, child: AppIconButton(icon: leadingIcon.withAppDefaultColor.icon!, onPressed: leadingAction))
          : leadingText != null
              ? _buttonWidget(leadingAction ?? () {}, leadingText)
              : null,
      padding: AppPaddings.snackBar,
      backgroundColor: AppColors.snackBarBackground,
      snackPosition: appDefaultSnackPosition,
      snackStyle: SnackStyle.FLOATING,
      animationDuration: appSnackBarDefaultAnimationDuration,
      duration: appSnackBarDefaultDuration,
      isDismissible: true,
    ).show();
  }

  Widget _buttonWidget(VoidCallback buttonFunction, String buttonText) => AppGeneralButton(text: buttonText, onTap: buttonFunction);
}
