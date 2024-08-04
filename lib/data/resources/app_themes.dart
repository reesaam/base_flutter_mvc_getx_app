import 'package:base_flutter_all_app/data/resources/app_fonts.dart';
import 'package:base_flutter_all_app/data/storage/app_local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../info/app_defaults.dart';
import 'app_colors.dart';
import 'app_elements.dart';

class AppThemes {
  final ThemeData? importedTheme;
  final bool? darkMode;
  AppThemes({this.importedTheme, this.darkMode});

  ThemeData get theme => _getTheme();

  ThemeData _getTheme() {
    ThemeData theme = _lightTheme;
    bool? storageResult = AppLocalStorage.to.loadSettings().fold((l) => null, (r) => r.darkMode);
    theme = importedTheme ?? (storageResult == true || darkMode == true ? _darkTheme : _lightTheme);
    return theme;
  }

  static get _lightTheme => ThemeData(
        fontFamily: AppFonts.defaultFont,
        appBarTheme: _mainAppBar,
        bottomNavigationBarTheme: _mainBottomBar,
        textTheme: _textTheme,
        backgroundColor: AppColors.appBackground,
        cardTheme: _cardTheme,
        buttonTheme: _buttonThemeData,
        checkboxTheme: _checkBoxThemeData,
        switchTheme: _switchThemeData,
      );

  static get _darkTheme => ThemeData(
        fontFamily: AppFonts.defaultFont,
        appBarTheme: _mainAppBar,
        bottomNavigationBarTheme: _mainBottomBar,
        textTheme: _textTheme,
        backgroundColor: AppColors.appBackground,
        cardTheme: _cardTheme,
        buttonTheme: _buttonThemeData,
        checkboxTheme: _checkBoxThemeData,
        switchTheme: _switchThemeData,
      );

  static get _mainAppBar => AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.appBarBackground,
        foregroundColor: AppColors.appPrimary,
      );

  static get _mainBottomBar => BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: AppColors.bottomBarBackground,
        selectedItemColor: AppColors.bottomBarSelected,
        unselectedItemColor: AppColors.bottomBarUnselected,
      );

  static get _defaultTextStyle => TextStyle(
        color: AppColors.appSecondary,
        fontSize: appDefaultFontSize,
        overflow: TextOverflow.ellipsis,
      );

  static get _textTheme => TextTheme(
        bodyLarge: _defaultTextStyle,
        bodyMedium: _defaultTextStyle,
        bodySmall: _defaultTextStyle,
        displayLarge: _defaultTextStyle,
        displayMedium: _defaultTextStyle,
        displaySmall: _defaultTextStyle,
        titleLarge: _defaultTextStyle,
        titleMedium: _defaultTextStyle,
        titleSmall: _defaultTextStyle,
      );

  static get _cardTheme => CardTheme(
        color: AppColors.cardBackground,
        shape: AppElements.defaultOutlineBorderFocused,
      );

  static get _buttonThemeData => ButtonThemeData(
        buttonColor: AppColors.buttonBackgroundNormal,
        disabledColor: AppColors.buttonBackgroundDisabled,
      );

  static get _checkBoxThemeData => CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.appCheckBoxTick),
        fillColor: MaterialStateProperty.all(AppColors.appCheckBox),
      );

  static get _switchThemeData => const SwitchThemeData();

  static get _calendarTheme => Theme.of(Get.context!).copyWith(
      colorScheme: ColorScheme.light(
          background: AppColors.appBackground,
          primary: AppColors.appPrimary,
          onPrimary: AppColors.textNormalLight,
          secondary: AppColors.appBackground,
          onSecondary: AppColors.textNormalDark,
          onError: AppColors.error,
          error: AppColors.error));
}
