import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';

class AppProgressIndicator {
  static Widget circular({Color? color}) => _AppProgressIndicatorCircular(
        indicatorColor: color,
      );

  static Widget linear({Color? color, Color? backgroundColor}) => _AppProgressIndicatorLinear(
        indicatorColor: color,
        indicatorBackgroundColor: backgroundColor,
      );
}

class _AppProgressIndicatorCircular extends CircularProgressIndicator {
  const _AppProgressIndicatorCircular({this.indicatorColor});

  final Color? indicatorColor;

  @override
  Color? get color => indicatorColor ?? AppColors.appDefaultColor;
}

class _AppProgressIndicatorLinear extends LinearProgressIndicator {
  const _AppProgressIndicatorLinear({this.indicatorColor, this.indicatorBackgroundColor});

  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;

  @override
  Color? get color => indicatorColor ?? AppColors.appDefaultColor;

  @override
  Color? get backgroundColor => indicatorBackgroundColor ?? AppColors.appBackground;
}
