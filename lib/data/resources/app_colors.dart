import 'package:flutter/material.dart';

class AppColors {
  ///Basics
  static Color get transparent => Colors.transparent;
  static Color get appBackground => _white;
  static Color get appPrimary => _black;
  static Color get appSecondary => _coral;
  static Color get appTertiary => _strawberry;
  static Color get appLight => _white;
  static Color get appDark => _black;
  static Color get appDisabled => _grey.withOpacity(0.8);
  static Color get appOnDisabled => _white.withOpacity(0.6);

  ///Colors
  static Color get _white => Colors.white;
  static Color get _black => Colors.black.withOpacity(0.8);
  static Color get _grey => Colors.grey;

  ///Special Colors
  static Color get _coral => const Color(0xFFFE7D6A);
  static Color get _strawberry => const Color(0xFFFC4C4E);
  static Color get _persianOrange => const Color(0xFFFC4C4E);
  static Color get _persianRed => const Color(0xFFCC3333);
  static Color get _persianGreen => const Color(0xff009D88);

  static Color get error => Colors.redAccent;
  static Color get noError => Colors.green;

  ///Text
  static Color get textNormal => appSecondary;
  static Color get textNormalOnSecondary => appPrimary;
  static Color get textNormalDark => appDark;
  static Color get textNormalLight => appLight;
  static Color get textDisabled => appDisabled;

  ///Elements
  static Color get dividerDefault => appSecondary;
  static Color get dividerOnSecondary => appSecondary;
  static Color get dividerLight => appLight;
  static Color get dividerDark => appDark;

  ///AppBar
  static Color get appBarBackground => appPrimary;
  static Color get appBarText => appSecondary;
  static Color get appBarTextLight => textNormalLight;
  static Color get appBarTextDark => textNormalDark;

  ///AppBottomBar
  static Color get bottomBarBackground => appPrimary;
  static Color get bottomBarSelected => appSecondary;
  static Color get bottomBarUnselected => appSecondary;

  ///SnackBar
  static Color get snackBarBackground => appSecondary;
  static Color get snackBarText => appPrimary;

  ///Card
  static Color get cardBackground => appBackground;
  static Color get cardText => textNormal;

  ///Button
  static Color get buttonBackgroundNormal => appPrimary;
  static Color get buttonBackgroundSecondary => appSecondary;
  static Color get buttonBackgroundDisabled => appDisabled;
  static Color get buttonTextNormal => textNormal;
  static Color get buttonTextOnSecondary => textNormalOnSecondary;
  static Color get buttonTextDisabled => appOnDisabled;

  ///TextFields
  static Color get textFieldText => textNormal;
  static Color get textFieldLabel => textNormal;
  static Color get textFieldHint => appOnDisabled;

  ///CheckBox
  static Color get appCheckBox => appPrimary;
  static Color get appCheckBoxTick => appSecondary;
  static Color get appCheckBoxBorder => appSecondary;

  ///Switch
  static Color get switchActive => appSecondary;

  ///Settings
  static Color get settingTitle => appSecondary;
  static Color get settingItem => appSecondary;
}
