import 'package:flutter/material.dart';

import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_paddings.dart';

class AppDividers {
  static Widget get general => Divider(color: AppColors.dividerDefault);

  static Widget generalText({required String text}) => Stack(alignment: Alignment.center, children: [
        Divider(color: AppColors.dividerDefault),
        Container(color: AppColors.appBackground, padding: AppPaddings.buttonXLarge, child: Text(text)),
      ]);

  static Widget generalTextPrimaryColor({required String text}) => Stack(alignment: Alignment.center, children: [
        Divider(color: AppColors.appPrimary),
        Container(color: AppColors.appSecondary, padding: AppPaddings.buttonXLarge, child: Text(text, style: TextStyle(color: AppColors.appPrimary))),
      ]);

  static Widget get generalPrimaryColor => Divider(color: AppColors.appPrimary);

  static Widget get settings => Divider(color: AppColors.appSecondary);
}
