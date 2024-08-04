import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    this.primaryColor,
    this.onSecondaryColor,
    this.loading,
    this.stateController,
  });

  final String text;
  final Function onTap;
  final IconData? icon;
  final IconData? leading;
  final bool? disabled;
  final bool? primaryColor;
  final bool? onSecondaryColor;
  final bool? loading;
  final MaterialStatesController? stateController;

  @override
  Widget? get child {
    List<Widget> children = loading == true
        ? [_buttonLoading]
        : [
            icon == null ? shrinkSizedBox : Icon(icon),
            Expanded(child: Center(child: Text(text, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, softWrap: true))),
            leading == null ? shrinkSizedBox : Icon(leading),
          ];
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, children: children);
  }

  @override
  VoidCallback? get onPressed => () => disabled == true || loading == true ? null : onTap();

  @override
  ButtonStyle? get style => ButtonStyle(
      backgroundColor: disabled == true
          ? MaterialStateProperty.all(AppColors.appDisabled)
          : primaryColor == true
              ? MaterialStateProperty.all(AppColors.appPrimary)
              : MaterialStateProperty.all(AppColors.appSecondary),
      foregroundColor: disabled == true
          ? MaterialStateProperty.all(AppColors.buttonTextDisabled)
          : primaryColor == true
              ? MaterialStateProperty.all(AppColors.buttonTextNormal)
              : MaterialStateProperty.all(AppColors.buttonTextOnSecondary),
      side: disabled == true ? MaterialStateProperty.all(AppElements.defaultBorderSideDisabled) : MaterialStateProperty.all(AppElements.defaultBorderSidePrimary),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(AppElements.defaultBorderLowRadiusShape),
      splashFactory: InkSplash.splashFactory);

  @override
  MaterialStatesController? get statesController =>
      stateController ?? (disabled == true ? MaterialStatesController(<MaterialState>{MaterialState.focused}) : MaterialStatesController(<MaterialState>{MaterialState.disabled}));

  Widget get _buttonLoading => SizedBox(
      height: 15,
      width: 15,
      child: AppProgressIndicator.circular(
        color: primaryColor == true ? AppColors.buttonTextNormal : AppColors.buttonTextOnSecondary,
        width: 3,
      ));
}
