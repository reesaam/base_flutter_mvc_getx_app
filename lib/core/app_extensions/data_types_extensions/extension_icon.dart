import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';

extension IconColor on Icon {
  Icon get withPrimaryColor => withColor(AppColors.appPrimary);
  Icon get withSecondaryColor => withColor(AppColors.appSecondary);
  Icon get withTertiaryColor => withColor(AppColors.appTertiary);
  Icon get withAppAppBackgroundColor => withColor(AppColors.appBackground);
}

extension IconSize on Icon {
  Icon withSize(double size) => Icon(icon, size: size, color: color);
  Icon withColor(Color color) => Icon(icon, size: size, color: color);
}
