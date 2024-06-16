import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/core_widgets.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';

class AppGeneralButton extends ElevatedButton {
  const AppGeneralButton({
    super.key,
    super.child,
    super.onPressed,
    required this.text,
    required this.onTap,
    this.icon,
    this.leading,
    this.disabled,
    this.lightButton,
    this.stateController,
  });

  final String text;
  final Function() onTap;
  final IconData? icon;
  final IconData? leading;
  final bool? disabled;
  final bool? lightButton;
  final MaterialStatesController? stateController;

  @override
  Widget? get child => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [icon == null ? shrinkSizedBox : Icon(icon), AutoSizeText(text), leading == null ? shrinkSizedBox : Icon(leading)]);

  @override
  VoidCallback? get onPressed => () => disabled == true ? null : onTap();

  @override
  ButtonStyle? get style => ButtonStyle(
      backgroundColor: lightButton == true
          ? MaterialStateProperty.all(AppColors.appBackground)
          : disabled == true
              ? MaterialStateProperty.all(AppColors.appBackground)
              : MaterialStateProperty.all(AppColors.buttonBackgroundNormal),
      foregroundColor: lightButton == true
          ? MaterialStateProperty.all(AppColors.buttonTextNormal)
          : disabled == true
              ? MaterialStateProperty.all(AppColors.buttonTextDisabled)
              : MaterialStateProperty.all(AppColors.buttonTextNormal),
      side: disabled == true ? MaterialStateProperty.all(AppElements.defaultBorderSideDisabled) : MaterialStateProperty.all(AppElements.defaultBorderSideFocused),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(AppElements.defaultBorderLowRadiusShape),
      splashFactory: InkSplash.splashFactory);

  @override
  MaterialStatesController? get statesController =>
      stateController ?? (disabled == true ? MaterialStatesController(<MaterialState>{MaterialState.focused}) : MaterialStatesController(<MaterialState>{MaterialState.disabled}));
}
