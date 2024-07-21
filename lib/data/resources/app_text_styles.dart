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

  ///Popup Menu
  static TextStyle get popupMenuItem => TextStyle(color: AppColors.appDefaultColor);

  ///AppBar
  static TextStyle get appBarTitle => TextStyle(color: AppColors.appBarText, fontSize: bigTitleSize);

  ///ModalBottomSheet
  static TextStyle get modalTitle => TextStyle(fontSize: titleSize);

  ///Dialogs
  static TextStyle get dialogAlertTitle => TextStyle(fontSize: titleSize);
  static TextStyle get dialogAlertText => TextStyle(fontSize: normalSize, color: AppColors.textNormalDark);

  ///SnackBar
  static TextStyle get snackBarMessage => TextStyle(color: AppColors.textNormalLight);
  static TextStyle get snackBarTitle => TextStyle(color: AppColors.textNormalDark);

  ///SplashScreen
  static TextStyle get splashScreenAppName => TextStyle(fontSize: AppSizes.splashScreenAppName);

  ///Contacts
  static TextStyle get contactsNoContacts => TextStyle(fontSize: titleSize, color: AppColors.appDefaultColor);
  static TextStyle get contactsListItem => TextStyle(color: AppColors.textNormalDark, fontSize: bigSize);
  static TextStyle get contactsChooseContact => TextStyle(fontSize: titleSize, color: AppColors.textNormalDark);

  ///Show Contact
  static TextStyle get contactsShowContactSectionTitle => const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle get contactsShowContactFullName => TextStyle(fontSize: bigTitleSize, color: AppColors.textNormalDark);
  static TextStyle get contactsShowContactInfoTitle => TextStyle(color: AppColors.textNormalDark, fontWeight: FontWeight.bold);
  static TextStyle get contactsShowContactInfoItem => TextStyle(color: AppColors.textNormalDark);

  ///Accounts
  static TextStyle get accountsTableItem => TextStyle(color: AppColors.textNormalDark);
  static TextStyle get accountsTableItemMenuItems => TextStyle(fontSize: bigSize);

  ///Accounts
  static TextStyle get accountsShowRecordTitle => TextStyle(fontSize: bigTitleSize, color: AppColors.textNormalDark);
  static TextStyle get accountsShowRecordInfoTitle => TextStyle(color: AppColors.textNormalDark, fontWeight: FontWeight.bold);
  static TextStyle get accountsShowRecordInfoItem => TextStyle(color: AppColors.textNormalDark);

  ///Contacts Balance
  static TextStyle get contactsBalanceHeader => TextStyle(color: AppColors.textNormalDark);
  static TextStyle get contactsBalanceTotal => TextStyle(color: AppColors.textNormalDark);

  ///Settings
  static TextStyle get settingsSectionTitle => TextStyle(fontSize: bigSize, color: AppColors.settingTitle);
  static TextStyle get settingsSectionItem => TextStyle(color: AppColors.settingItem);
}
