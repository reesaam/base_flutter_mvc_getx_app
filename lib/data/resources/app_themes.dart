import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../info/app_defaults.dart';
import 'app_colors.dart';
import 'app_elements.dart';

class AppThemes {
  static get mainTheme => ThemeData(
        fontFamily: 'Ubuntu',
        appBarTheme: mainAppBar,
        bottomNavigationBarTheme: mainBottomBar,
        textTheme: textTheme,
        backgroundColor: AppColors.appBackground,
        cardTheme: cardTheme,
        buttonTheme: buttonThemeData,
        checkboxTheme: checkBoxThemeData,
        switchTheme: switchThemeData,
      );

  static get mainAppBar => AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appPrimary,
      );

  static get mainBottomBar => BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: AppColors.bottomBarBackground,
        selectedItemColor: AppColors.bottomBarSelected,
        unselectedItemColor: AppColors.bottomBarUnselected,
      );

  static get defaultTextStyle => TextStyle(
        color: AppColors.appSecondary,
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  static get textTheme => TextTheme(
        bodyLarge: defaultTextStyle,
        bodyMedium: defaultTextStyle,
        bodySmall: defaultTextStyle,
        displayLarge: defaultTextStyle,
        displayMedium: defaultTextStyle,
        displaySmall: defaultTextStyle,
        titleLarge: defaultTextStyle,
        titleMedium: defaultTextStyle,
        titleSmall: defaultTextStyle,
      );

  static get cardTheme => CardTheme(
        color: AppColors.cardBackground,
        shape: AppElements.defaultOutlineBorderFocused,
      );

  static get buttonThemeData => ButtonThemeData(
        buttonColor: AppColors.buttonBackgroundNormal,
        disabledColor: AppColors.buttonBackgroundDisabled,
      );

  static get checkBoxThemeData => CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.appCheckBoxTick),
        fillColor: MaterialStateProperty.all(AppColors.appCheckBox),
      );

  static get switchThemeData => const SwitchThemeData();

  static get calendarTheme => Theme.of(Get.context!).copyWith(
      colorScheme: ColorScheme.light(
          background: AppColors.appBackground,
          primary: AppColors.appPrimary,
          onPrimary: AppColors.textNormalLight,
          secondary: AppColors.appBackground,
          onSecondary: AppColors.textNormalDark,
          onError: AppColors.error,
          error: AppColors.error));
}
