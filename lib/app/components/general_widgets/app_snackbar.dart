import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_extensions/extensions_on_data_types/extension_icon.dart';
import '../../../core/app_extensions/extensions_on_material_widgets/extension_on_text.dart';
import '../../../core/core_functions.dart';
import '../../../core/core_widgets.dart';
import '../../../data/info/app_defaults.dart';
import '../../../data/resources/app_elements.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../data/resources/app_theme/app_themes.dart';
import '../../../data/resources/app_theme/app_themes_variables.dart';
import '../buttons/app_general_button.dart';
import '../buttons/app_icon_button.dart';

class AppSnackBar {
  show({
    String? message,
    String? title,
    Widget? widget,
    Icon? icon,
    Function()? leadingAction,
    Icon? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
    Color? backgroundColor,
    Color? textColor,
    bool? withProgressIndicator,
  }) =>
      _showSnackBar(
        message: message,
        title: title,
        widget: widget,
        icon: icon,
        leadingAction: leadingAction,
        leadingIcon: leadingIcon,
        leadingText: leadingText,
        buttonText: buttonText,
        buttonAction: buttonAction,
        backgroundColor: backgroundColor,
        textColor: textColor,
        showProgressIndicator: withProgressIndicator,
      );

  showError({
    String? message,
    String? title,
    Widget? widget,
    Icon? icon,
    Function()? leadingAction,
    Icon? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
  }) =>
      _showSnackBar(
        message: message,
        title: title,
        widget: widget,
        icon: icon,
        leadingAction: leadingAction,
        leadingIcon: leadingIcon,
        leadingText: leadingText,
        buttonText: buttonText,
        buttonAction: buttonAction,
        backgroundColor: AppThemes.to.colorScheme.error,
      );

  showWarning({
    String? message,
    String? title,
    Widget? widget,
    Icon? icon,
    Function()? leadingAction,
    Icon? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
  }) =>
      _showSnackBar(
        message: message,
        title: title,
        widget: widget,
        icon: icon,
        leadingAction: leadingAction,
        leadingIcon: leadingIcon,
        leadingText: leadingText,
        buttonText: buttonText,
        buttonAction: buttonAction,
        backgroundColor: AppThemes.to.hintColor,
      );

  _showSnackBar({
    String? message,
    String? title,
    Widget? widget,
    Function(GetSnackBar)? onTap,
    Icon? icon,
    Function()? leadingAction,
    Icon? leadingIcon,
    String? leadingText,
    String? buttonText,
    Function()? buttonAction,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    bool? isDismissible,
    CrossAxisAlignment? crossAxisAlignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Duration? duration,
    bool? showProgressIndicator,
    AnimationController? progressIndicatorController,
  }) =>
      GetSnackBar(
        //Elements
        titleText: title == null ? shrinkSizedBox : Text(title).withColor(textColor ?? AppThemes.to.canvasColor),
        messageText: widget ??
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  message == null ? const SizedBox.shrink() : Text(message).withColor(textColor ?? AppThemes.to.canvasColor),
                  buttonText == null
                      ? shrinkSizedBox
                      : Column(children: [
                          AppSpaces.h20,
                          AppGeneralButton(text: buttonText, primaryColor: true, onTap: buttonAction ?? nullFunction),
                        ]),
                ]),
        onTap: onTap == null ? null : (snack) => onTap(snack),
        mainButton: leadingIcon == null
            ? null
            : leadingText == null
                ? AppIconButton(
                    primaryColor: true,
                    icon: leadingIcon,
                    onTap: leadingAction ?? nullFunction,
                  )
                : _buttonWidget(leadingAction ?? nullFunction, leadingText),

        //Specifications
        padding: padding ?? AppPaddings.snackBar,
        margin: margin ?? AppPaddings.snackBar,
        snackPosition: appDefaultSnackPosition,
        snackStyle: SnackStyle.FLOATING,
        animationDuration: appSnackBarDefaultAnimationDuration,
        duration: duration ?? appSnackBarDefaultDuration,
        isDismissible: isDismissible ?? true,
        backgroundColor: backgroundColor ?? AppThemes.to.snackBarTheme.backgroundColor ?? AppThemes.to.colorScheme.tertiary,
        borderRadius: AppElements.defaultRadius,
        icon: icon?.withColor(iconColor ?? textColor ?? AppThemes.to.canvasColor),
        shouldIconPulse: false,
        showProgressIndicator: showProgressIndicator ?? false,
        progressIndicatorBackgroundColor: showProgressIndicator == true ? backgroundColor ?? AppThemes.to.canvasColor : null,
        progressIndicatorController: progressIndicatorController,
      ).show();

  Widget _buttonWidget(Function() buttonFunction, String buttonText) => AppGeneralButton(text: buttonText, onTap: buttonFunction);
}
