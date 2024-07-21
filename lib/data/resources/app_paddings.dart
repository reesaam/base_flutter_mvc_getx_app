import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPaddings {
  ///General
  static EdgeInsets get zero => const EdgeInsets.all(0);
  static EdgeInsets get pages => const EdgeInsets.all(10);

  ///Elements
  static EdgeInsets get textFieldContent => const EdgeInsets.symmetric(horizontal: 20, vertical: 10);

  ///AppBar
  static EdgeInsets get appBarActions => const EdgeInsets.only(right: 10);

  ///Drawer
  static EdgeInsets get drawerHeader => const EdgeInsets.fromLTRB(10, 20, 20, 20);
  static EdgeInsets get drawerFooter => const EdgeInsets.fromLTRB(20, 10, 0, 20);

  ///Modals
  static EdgeInsets get generalBottomModal => EdgeInsets.fromLTRB(20, 10, 20, Get.context!.mediaQuery.viewInsets.bottom);
  static EdgeInsets get generalAlertDialog => const EdgeInsets.all(20);
  static EdgeInsets get modalItems => const EdgeInsets.symmetric(vertical: 15);

  ///SnackBar
  static EdgeInsets get snackBar => const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  ///SplashScreen
  static EdgeInsets get splashScreenProgressIndicator => const EdgeInsets.only(top: 200);

  ///Homepage
  static EdgeInsets get homepageTopBar => const EdgeInsets.symmetric(horizontal: 30, vertical: 20);
  static EdgeInsets get homepageDateTimeCard => const EdgeInsets.symmetric(vertical: 20);
  static EdgeInsets get homepageSummeryCard => const EdgeInsets.all(20);
  static EdgeInsets get homepageSummeryCardData => const EdgeInsets.fromLTRB(20, 0, 50, 0);
  static EdgeInsets get homepageDateTimeCardSettingIcon => const EdgeInsets.fromLTRB(0, 10, 10, 0);
  static EdgeInsets get homepageButtons => const EdgeInsets.fromLTRB(50, 40, 50, 0);

  ///Contacts
  static EdgeInsets get contactsNoContacts => const EdgeInsets.only(top: 50);
  static EdgeInsets get contactsItem => const EdgeInsets.fromLTRB(20, 5, 0, 5);
  static EdgeInsets get contactsShowContactItems => const EdgeInsets.symmetric(vertical: 20, horizontal: 10);
  static EdgeInsets get contactsShowContactItem => const EdgeInsets.symmetric(vertical: 5, horizontal: 10);

  ///Accounts
  static EdgeInsets get accountsTopBar => const EdgeInsets.symmetric(horizontal: 40, vertical: 10);
  static EdgeInsets get accountsSummaryCard => const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets get accountsNoRecordText => const EdgeInsets.only(top: 50);
  static EdgeInsets get accountsTable => const EdgeInsets.symmetric(horizontal: 10);
  static EdgeInsets get accountsTableItem => const EdgeInsets.symmetric(horizontal: 5, vertical: 10);
  static EdgeInsets get accountsSelectContactList => const EdgeInsets.all(10);
  static EdgeInsets get accountsShowRecordItem => const EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  ///Contacts Balance
  static EdgeInsets get contactsBalanceItemDetailsItem => const EdgeInsets.symmetric(vertical: 5, horizontal: 20);

  ///ListPage
  static EdgeInsets get listPageSearchBox => const EdgeInsets.only(bottom: 10);

  ///Settings
  static EdgeInsets get settingsSection => const EdgeInsets.fromLTRB(0, 20, 0, 10);
  static EdgeInsets get settingsItem => const EdgeInsets.symmetric(horizontal: 15, vertical: 10);

  ///Update
  static EdgeInsets get updateVersions => const EdgeInsets.symmetric(horizontal: 30, vertical: 20);
  static EdgeInsets get updateButtons => const EdgeInsets.symmetric(horizontal: 50);
}
