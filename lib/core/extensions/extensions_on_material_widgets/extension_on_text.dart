import 'package:flutter/material.dart';

import '../../../ui_kit/theme/app_themes.dart';
import '../../../ui_kit/theme/app_themes_variables.dart';

extension ExtensionTextCopyWith on Text {
  Text copyWith({
    String? text,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    Key? key,
    Locale? locale,
    Color? selectionColor,
    String? semanticsLabel,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextHeightBehavior? textHeightBehavior,
    TextScaler? textScaler,
    TextWidthBasis? textWidthBasis,
  }) =>
      Text(
        text ?? data!,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        key: key,
        locale: locale,
        selectionColor: selectionColor,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textDirection: textDirection,
        textHeightBehavior: textHeightBehavior,
        textScaler: textScaler,
        textWidthBasis: textWidthBasis,
      );
}

extension ExtensionTextColor on Text {
  Text withColor(Color color) => copyWith(style: style?.copyWith(color: color) ?? TextStyle(color: color));
  Text get withCanvasColor => withColor(AppThemes.to.canvasColor);
  Text get withPrimaryColor => withColor(AppThemes.to.primaryColor);
  Text get withSecondaryColor => withColor(AppThemesVariables.appSecondary);
  Text get withTertiaryColor => withColor(AppThemesVariables.appTertiary);
  Text get withDisabledColor => withColor(AppThemes.to.disabledColor);
}

extension ExtensionTextSize on Text {
  Text withSize(double fontSize) => copyWith(style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize));
}

extension ExtensionTextAlignment on Text {
  Text withTextAlign(TextAlign? align) => copyWith(textAlign: align);
  Text get centered => withTextAlign(TextAlign.center);
  Text get justified => withTextAlign(TextAlign.justify);
}
