import 'package:flutter/material.dart';

import '../theme/app_themes_variables.dart';

class AppTextStyles extends TextStyle {
  final TextStyle? themeData;
  const AppTextStyles({this.themeData});

  ///Card
  factory AppTextStyles.cardTitle() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///Text Fields
  factory AppTextStyles.textFieldText() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textFieldLabel() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textFieldHint() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textError() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///Popup Menu
  factory AppTextStyles.popupMenuItem() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.popupMenuItemSecondary() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///AppBar
  factory AppTextStyles.appBarTitle() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///ModalBottomSheet
  factory AppTextStyles.modalTitle() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///Dialogs
  factory AppTextStyles.dialogAlertTitle() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.dialogAlertText() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///SnackBar
  factory AppTextStyles.snackBarMessage() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.snackBarTitle() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///TextField
  factory AppTextStyles.textFieldCounter() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textFieldCounterError() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///SplashScreen
  factory AppTextStyles.splashScreenAppName() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);

  ///Settings
  factory AppTextStyles.settingsSectionTitle() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.settingsSectionItem() => AppTextStyles(themeData: AppThemesVariables.textTheme.displayLarge);
}
