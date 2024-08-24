import 'package:flutter/material.dart';

import '../../../data/resources/app_paddings.dart';

extension ExtensionAppPaddingsCopyWith on EdgeInsets {
  AppPaddings copyWithSymmetric({
    double? horizontal,
    double? vertical,
  }) =>
      AppPaddings.symmetric(
        horizontal: horizontal ?? this.horizontal,
        vertical: vertical ?? this.vertical,
      );
}
