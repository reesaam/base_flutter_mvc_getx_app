import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/core_functions.dart';
import '../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../resources/paddings.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.undoController,
    this.label,
    this.hint,
    this.textInputType,
    this.textInputAction,
    this.textDirection,
    this.isPassword,
    this.leadingIcon,
    this.leadingAction,
    this.prefixIcon,
    this.prefixAction,
    this.suffixIcon,
    this.suffixAction,
    this.wholeWidgetAction,
    this.onChangedAction,
    this.inputFormatters,
    this.editable,
    this.hasCounter,
    this.errorText,
    this.maxLines,
    this.maxLength,
    this.showMaxLength,
    this.expandable,
    this.autoFocus,
    this.focusNode,
  });

  final TextEditingController controller;
  final UndoHistoryController? undoController;
  final String? label;
  final String? hint;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final bool? isPassword;
  final Icon? leadingIcon;
  final Function()? leadingAction;
  final Icon? prefixIcon;
  final Function()? prefixAction;
  final Icon? suffixIcon;
  final Function()? suffixAction;
  final Function()? wholeWidgetAction;
  final Function? onChangedAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool? editable; // Default is false
  final bool? hasCounter; // Default is false
  final String? errorText; // Being null means it has no error
  final int? maxLines; // Default is 1
  final int? maxLength; // Default is Infinite
  final bool? showMaxLength; // Default is false
  final bool? expandable; // Default is false
  final bool? autoFocus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => TextFormField(
      controller: controller,
      undoController: undoController,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      textDirection: textDirection,
      obscureText: isPassword ?? false,
      // style: errorText == null ? AppTextStyles.textFieldText : AppTextStyles.textError,
      // cursorColor: AppColors.textNormal,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction,
      maxLines: expandable == true ? null : maxLines,
      maxLength: maxLength,
      expands: expandable == true,
      enableInteractiveSelection: editable == false || wholeWidgetAction != null ? false : true,
      autofocus: autoFocus ?? false,
      focusNode: focusNode,
      canRequestFocus: editable == false || wholeWidgetAction != null ? false : true,
      scrollPhysics: const BouncingScrollPhysics(),
      onTap: wholeWidgetAction,
      onChanged: (value) => onChangedAction,
      onTapOutside: (event) => FocusScope.of(context).previousFocus(),
      inputFormatters: inputFormatters,
      buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => _buildCounter(currentLength),
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: double.maxFinite),
        contentPadding: AppPaddings.textFieldContent,
        labelText: label,
        // labelStyle: errorText == null ? AppTextStyles.textFieldText : AppTextStyles.textError,
        hintText: hint,
        // hintStyle: AppTextStyles.textFieldHint,
        alignLabelWithHint: true,
        hintMaxLines: 1,
        icon: _leading,
        prefixIcon: _prefix,
        suffixIcon: _suffix,
        // border: AppElements.borderOutlined,
        // enabledBorder: errorText == null ? AppElements.borderOutlined : AppElements.borderOutlinedError,
        // disabledBorder: AppElements.borderOutlinedDisabled,
        // focusedBorder: AppElements.borderOutlinedFocused,
        isDense: true,
        isCollapsed: true,
        // errorStyle: errorText == null ? null : AppTextStyles.textError,
        // errorBorder: errorText == null ? null : AppElements.borderOutlinedError,
        errorText: errorText,
      ));

  Widget? get _leading => leadingIcon == null
      ? null
      : InkWell(
          onTap: () => leadingAction == null ? nullFunction() : leadingAction!(),
          child: leadingIcon?.withSecondaryColor,
        );

  Widget? get _prefix => prefixIcon == null
      ? null
      : InkWell(
          onTap: () => prefixAction == null ? nullFunction() : prefixAction!(),
          child: prefixIcon?.withSecondaryColor,
        );

  Widget? get _suffix => suffixIcon == null
      ? null
      : InkWell(
          onTap: () => suffixAction == null ? nullFunction() : suffixAction!(),
          child: suffixIcon?.withSecondaryColor,
        );

  Widget _buildCounter(int currentLength) =>
      Text(showMaxLength == true ? '${currentLength.toString()} / ${maxLength.toString()}' : currentLength.toString());
}

mixin withSecondaryColor {
}
