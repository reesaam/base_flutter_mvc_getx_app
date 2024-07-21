import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_elements.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.icon,
    this.textInputType,
    this.textInputAction,
    this.suffixAction,
    this.wholeWidgetAction,
    this.editable,
    this.hasError,
    this.maxLines,
    this.expandable,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final VoidCallback? suffixAction;
  final VoidCallback? wholeWidgetAction;
  final bool? editable;
  final bool? hasError;
  final int? maxLines;
  final bool? expandable;

  Widget suffix() => InkWell(onTap: suffixAction, child: Icon(icon, color: AppColors.textNormalDark));

  @override
  Widget build(BuildContext context) => TextField(
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      style: AppTextStyles.textFieldText,
      cursorColor: AppColors.textNormalDark,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction,
      maxLines: maxLines,
      expands: expandable ?? false,
      enableInteractiveSelection: editable == false || wholeWidgetAction != null ? false : true,
      canRequestFocus: editable == false || wholeWidgetAction != null ? false : true,
      onTap: wholeWidgetAction,
      decoration: InputDecoration(
        contentPadding: AppPaddings.textFieldContent,
        labelText: label,
        labelStyle: AppTextStyles.textFieldLabel,
        hintText: hint,
        hintStyle: AppTextStyles.textFieldHint,
        hintMaxLines: 1,
        alignLabelWithHint: true,
        suffixIcon: suffix(),
        border: AppElements.defaultOutlineBorder,
        enabledBorder: hasError == true ? AppElements.defaultOutlineBorderError : AppElements.defaultOutlineBorder,
        disabledBorder: AppElements.defaultOutlineBorderDisabled,
        focusedBorder: AppElements.defaultOutlineBorderFocused,
        isDense: true,
        isCollapsed: true,
      ));
}
