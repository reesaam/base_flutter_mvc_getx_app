import 'package:flutter/material.dart';

import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../core/app_extensions/widgets_extensions/extension_text.dart';
import '../../../core/core_widgets.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_sizes.dart';

class AppIconButton extends MaterialButton {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.primaryColor,
    this.text,
    this.size,
  }) : super(onPressed: onTap);

  final Icon icon;
  final Function() onTap;
  final bool? primaryColor;
  final String? text;
  final Size? size;

  @override
  VoidCallback? get onPressed => onTap();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size?.height,
        width: size?.width,
        child: Column(children: [
          IconButton(
            padding: AppPaddings.zero,
            iconSize: AppSizes.iconButtonIconSize,
            onPressed: onTap,
            icon: primaryColor == true ? icon.withPrimaryColor : icon.withSecondaryColor,
          ),
          text == null
              ? shrinkSizedBox
              : primaryColor == true
                  ? Text(text!).withPrimaryColor
                  : Text(text!),
        ]));
  }
}
