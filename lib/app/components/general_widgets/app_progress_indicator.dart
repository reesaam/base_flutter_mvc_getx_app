import 'package:flutter/material.dart';

import '../../../data/info/app_defaults.dart';
import '../../../data/resources/app_colors.dart';

class AppProgressIndicator {
  static Widget circular({
    Color? color,
    double? width,
  }) =>
      _AppProgressIndicatorCircular(
        indicatorColor: color,
        width: width,
      );

  static Widget linear({
    Color? color,
    Color? backgroundColor,
  }) =>
      _AppProgressIndicatorLinear(
        indicatorColor: color,
        indicatorBackgroundColor: backgroundColor,
      );
}

class _AppProgressIndicatorCircular extends CircularProgressIndicator {
  const _AppProgressIndicatorCircular({this.indicatorColor, this.width});

  final Color? indicatorColor;
  final double? width;

  @override
  Color? get color => indicatorColor ?? AppColors.appSecondary;

  @override
  double get strokeWidth => width ?? defaultCircularProgressBarWidth;
}

class _AppProgressIndicatorLinear extends LinearProgressIndicator {
  const _AppProgressIndicatorLinear({this.indicatorColor, this.indicatorBackgroundColor});

  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;

  @override
  Color? get color => indicatorColor ?? AppColors.appSecondary;

  @override
  Color? get backgroundColor => indicatorBackgroundColor ?? AppColors.appBackground;
}
