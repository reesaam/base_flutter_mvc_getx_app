import 'package:flutter/material.dart';

import '../theme/themes_variables.dart';

class AppTextStyles extends TextStyle {
  final TextStyle? style;
  const AppTextStyles({this.style});

  ///Card
  factory AppTextStyles.cardTitle() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///Text Fields
  factory AppTextStyles.textFieldText() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textFieldLabel() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textFieldHint() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textError() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///Popup Menu
  factory AppTextStyles.popupMenuItem() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.popupMenuItemSecondary() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///AppBar
  factory AppTextStyles.appBarTitle() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///ModalBottomSheet
  factory AppTextStyles.modalTitle() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///Dialogs
  factory AppTextStyles.dialogAlertTitle() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.dialogAlertText() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///SnackBar
  factory AppTextStyles.snackBarMessage() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.snackBarTitle() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///TextField
  factory AppTextStyles.textFieldCounter() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.textFieldCounterError() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///SplashScreen
  factory AppTextStyles.splashScreenAppName() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);

  ///Settings
  factory AppTextStyles.settingsSectionTitle() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
  factory AppTextStyles.settingsSectionItem() => AppTextStyles(style: AppThemesVariables.textTheme.displayLarge);
}
