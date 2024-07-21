import 'package:flutter/material.dart';

import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_sizes.dart';

class AppIconButton extends MaterialButton {
  const AppIconButton({super.key, required this.icon, required super.onPressed, this.lightColor});

  final IconData icon;
  final bool? lightColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.iconButtonSize,
        width: AppSizes.iconButtonSize,
        child: IconButton(
            padding: AppPaddings.zero, iconSize: AppSizes.iconButtonIconSize, onPressed: onPressed, icon: lightColor == true ? Icon(icon).withAppAppBackgroundColor : Icon(icon).withAppDefaultColor));
  }
}
