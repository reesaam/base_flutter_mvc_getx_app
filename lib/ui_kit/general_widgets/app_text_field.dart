import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:get/get.dart';

import '../../../core/core_functions.dart';
import '../../core/app_localization_texts.dart';
import '../../core/extensions/extensions_on_data_types/extension_icon.dart';
import '../../core/verifiers/regexes.dart';
import '../resources/elements.dart';
import '../resources/paddings.dart';
import '../resources/text_styles.dart';
import '../theme/theme_functions.dart';
import '../theme/themes.dart';

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
    this.regexValidator,
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
  final Function(String)? onChangedAction;
  final String? regexValidator;
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
  Widget build(BuildContext context) {
    bool isDark = AppThemeFunctions.getMode();

    return TextFormField(
        controller: controller,
        undoController: undoController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        textDirection: textDirection,
        obscureText: isPassword ?? false,
        style: errorText == null ? AppTextStyles.textFieldText() : AppTextStyles.textError(),
        cursorColor: AppThemes.to.primaryColor,
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
        onTap: wholeWidgetAction == null ? () {} : () => wholeWidgetAction!(),
        onChanged: (value) => onChangedAction == null ? () {} : onChangedAction!(value),
        onTapOutside: (event) => FocusScope.of(context).previousFocus(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => _errorDetector(),
        inputFormatters: inputFormatters,
        buildCounter: (context, {required currentLength, required isFocused, required maxLength}) =>
            hasCounter == true || showMaxLength == true ? _buildCounter(currentLength) : null,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: double.maxFinite),
          contentPadding: AppPaddings.textFieldContent,
          labelText: label,
          labelStyle: errorText == null ? AppTextStyles.textFieldText() : AppTextStyles.textError(),
          hintText: hint,
          hintStyle: AppTextStyles.textFieldHint(),
          alignLabelWithHint: true,
          hintMaxLines: 1,
          icon: _leading,
          prefixIcon: _prefix,
          suffixIcon: _suffix,
          border: isDark ? AppElements.borderOutlinedDark : AppElements.borderOutlinedLight,
          enabledBorder: _errorDetector() == null
              ? isDark
                  ? AppElements.borderOutlinedDark
                  : AppElements.borderOutlinedLight
              : isDark
                  ? AppElements.borderOutlinedErrorDark
                  : AppElements.borderOutlinedErrorLight,
          disabledBorder: isDark ? AppElements.borderOutlinedDisabledDark : AppElements.borderOutlinedDisabledLight,
          focusedBorder: isDark ? AppElements.borderOutlinedFocusedDark : AppElements.borderOutlinedFocusedLight,
          isDense: true,
          isCollapsed: true,
          errorStyle: _errorDetector() == null ? null : AppTextStyles.textError(),
          errorBorder: _errorDetector() == null
              ? null
              : isDark
                  ? AppElements.borderOutlinedErrorDark
                  : AppElements.borderOutlinedErrorLight,
          errorText: _errorDetector(),
        ));
  }

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

  String? _errorDetector() {
    String? text;

    //Regex Check
    if (regexValidator != null) _regexValidator(controller.text) ? text = null : text = errorText ?? Texts.to.incorrect;

    //In case of conditions to check and show error are absent ErrorText will come from above
    if (regexValidator == null) text == errorText;

    return text;
  }

  bool _regexValidator(String value) => value == Texts.to.empty ? true : RegexVal.hasMatch(value, regexValidator!);

  Widget _buildCounter(int currentLength) {
    String text = '';
    if (hasCounter == true) {
      text = '${currentLength.toString()}${maxLength == null ? Texts.to.empty : ' / ${maxLength.toString()}'}';
    } else if (showMaxLength == true) {
      text = currentLength.toString();
    }
    return Text(text);
  }
}
