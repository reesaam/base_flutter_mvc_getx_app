import 'package:flutter/material.dart';

import '../info/app_defaults.dart';
import 'app_colors.dart';
import 'app_sizes.dart';

class AppTextStyles {
  static get defaultSize => appDefaultFontSize;
  static get smallSize => defaultSize - 2;
  static get normalSize => defaultSize;
  static get bigSize => defaultSize + 3;
  static get titleSize => defaultSize + 5;
  static get bigTitleSize => defaultSize + 8;

  ///Card
  static TextStyle get cardTitle => TextStyle(color: AppColors.cardText, fontSize: bigSize);

  ///Text Fields
  static TextStyle get textFieldText => TextStyle(color: AppColors.textFieldText);
  static TextStyle get textFieldLabel => TextStyle(color: AppColors.textFieldLabel);
  static TextStyle get textFieldHint => TextStyle(color: AppColors.textFieldHint);
  static TextStyle get textError => TextStyle(color: AppColors.error);

  ///Popup Menu
  static TextStyle get popupMenuItem => TextStyle(color: AppColors.appPrimary);
  static TextStyle get popupMenuItemSecondary => TextStyle(color: AppColors.appSecondary);

  ///AppBar
  static TextStyle get appBarTitle => TextStyle(color: AppColors.appBarText, fontSize: bigTitleSize);

  ///ModalBottomSheet
  static TextStyle get modalTitle => TextStyle(fontSize: titleSize, color: AppColors.appPrimary);

  ///Dialogs
  static TextStyle get dialogAlertTitle => TextStyle(fontSize: titleSize, color: AppColors.appPrimary);
  static TextStyle get dialogAlertText => TextStyle(fontSize: normalSize, color: AppColors.appTertiary);

  ///SnackBar
  static TextStyle get snackBarMessage => TextStyle(color: AppColors.textNormalOnSecondary);
  static TextStyle get snackBarTitle => TextStyle(color: AppColors.textNormalDark);

  ///TextField
  static TextStyle get textFieldCounter => TextStyle(color: AppColors.textNormal);
  static TextStyle get textFieldCounterError => TextStyle(color: AppColors.error);

  ///SplashScreen
  static TextStyle get splashScreenAppName => TextStyle(fontSize: AppSizes.splashScreenAppName);

  ///Settings
  static TextStyle get settingsSectionTitle => TextStyle(fontSize: bigSize, color: AppColors.settingTitle);
  static TextStyle get settingsSectionItem => TextStyle(color: AppColors.settingItem);
}
