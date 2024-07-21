import 'package:flutter/material.dart';

import '../../../data/resources/app_text_styles.dart';

class AppPopupMenuItem extends PopupMenuItem {
  const AppPopupMenuItem({
    super.key,
    super.child,
    required this.text,
    required this.onTapFunction,
  });

  final String text;
  final Function() onTapFunction;

  @override
  Widget? get child => Text(text, style: AppTextStyles.popupMenuItem);

  @override
  VoidCallback get onTap => onTapFunction;

  Widget build(BuildContext context) => PopupMenuItem(child: child);
}
