import 'package:flutter/material.dart';

extension CopyWith on Text {
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

extension TextColor on Text {
  Text get withPrimaryColor => this;
  Text get withSecondaryColor => this;
  Text get withTertiaryColor => this;
  Text get withDisabledColor => this;
}

extension TextSize on Text {
  Text withTextSize(double fontSize) => copyWith(style: style?.copyWith(fontSize: fontSize) ?? TextStyle(fontSize: fontSize));
}
