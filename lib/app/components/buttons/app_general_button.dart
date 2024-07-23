import 'package:flutter/material.dart';

import '../../../core/core_widgets.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';
import '../general_widgets/app_progress_indicator.dart';

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
    this.loading,
    this.stateController,
  });

  final String text;
  final Function() onTap;
  final IconData? icon;
  final IconData? leading;
  final bool? disabled;
  final bool? lightButton;
  final bool? loading;
  final MaterialStatesController? stateController;

  @override
  Widget? get child {
    List<Widget> children = loading == true ? [_buttonLoading] : [icon == null ? shrinkSizedBox : Icon(icon), Text(text), leading == null ? shrinkSizedBox : Icon(leading)];
    return Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: children);
  }

  @override
  VoidCallback? get onPressed => () => disabled == true || loading == true ? null : onTap();

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

  Widget get _buttonLoading => Container(
      height: 20,
      width: 20,
      child: AppProgressIndicator.circular(color: lightButton == true ? AppColors.buttonBackgroundNormal : AppColors.appBackground));
}
