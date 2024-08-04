import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';

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
  Text get withPrimaryColor => copyWith(style: style?.copyWith(color: AppColors.appPrimary) ?? TextStyle(color: AppColors.appPrimary));
  Text get withSecondaryColor => copyWith(style: style?.copyWith(color: AppColors.appSecondary) ?? TextStyle(color: AppColors.appSecondary));
  Text get withTertiaryColor => copyWith(style: style?.copyWith(color: AppColors.appTertiary) ?? TextStyle(color: AppColors.appTertiary));
  Text get withDisabledColor => copyWith(style: style?.copyWith(color: AppColors.appDisabled) ?? TextStyle(color: AppColors.appDisabled));
}
