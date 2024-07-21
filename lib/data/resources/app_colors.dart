import 'package:flutter/material.dart';

class AppColors {
  ///Basics
  static Color get transparent => Colors.transparent;
  static Color get appBackground => _white;
  static Color get appDefaultColor => _grey;
  static Color get appDefaultColorSecond => _coral;
  static Color get appDefaultDisabledColor => _grey.withOpacity(0.5);

  ///Colors
  static Color get _white => Colors.white;
  static Color get _black => Colors.black;
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
  static Color get textNormalDark => _black.withOpacity(0.6);
  static Color get textNormalLight => _white;
  static Color get textDisabled => appDefaultDisabledColor;

  ///Elements
  static Color get dividerDefaultColor => _black;

  ///AppBar
  static Color get appBarBackground => appBackground;
  static Color get appBarText => textNormalDark;

  ///AppBottomBar
  static Color get bottomBarBackground => appBackground;
  static Color get bottomBarSelected => textNormalDark;
  static Color get bottomBarUnselected => textNormalDark;

  ///SnackBar
  static Color get snackBarBackground => appDefaultColorSecond;

  ///Card
  static Color get cardBackground => appBackground;
  static Color get cardText => appDefaultColor;

  ///Button
  static Color get buttonBackgroundNormal => appDefaultColorSecond;
  static Color get buttonBackgroundDisabled => appDefaultDisabledColor;
  static Color get buttonTextNormal => textNormalDark;
  static Color get buttonTextDisabled => textDisabled;

  ///TextFields
  static Color get textFieldText => textNormalDark;
  static Color get textFieldLabel => _grey;
  static Color get textFieldHint => _grey;

  ///CheckBox
  static Color get appCheckBox => appDefaultColor;
  static Color get appCheckBoxTick => appBackground;

  ///Switch
  static Color get switchActive => appDefaultColorSecond;

  ///Settings
  static Color get settingTitle => appDefaultColorSecond;
  static Color get settingItem => _grey;
}
