import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_test_controller.dart';

class AdminTestPage extends CoreView<AdminTestController> {
  const AdminTestPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.general(),
        _appPages(),
        _themes(),
        _checkConnection(),
        _files(),
        _permissions(),
        _notifications(),
        _appData(),
      ]);

  _appPages() => AdminFunctions.sectionGrid(
      items: List.generate(
          AppPageDetails().listPages.length,
          (index) => AppGeneralButton(
                text: AppPageDetails().listPages[index].pageName ?? 'Unknown',
                onTap: () => goToPage(AppPageDetails().listPages[index].pageRoute),
              )),
      title: 'App All Pages');

  _themes() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Change Dark Mode', function: controller.changeDarkMode),
      ], title: 'Themes');

  _checkConnection() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Connection Status', function: controller.internetConnection),
        AdminFunctions.itemButton(text: 'Internet Connection', function: controller.internetStatus),
        AdminFunctions.itemButton(text: 'Internet Status', function: controller.checkConnection),
      ], title: 'Connections');

  _files() => AdminFunctions.sectionGrid(items: [
        AdminFunctions.itemButton(text: 'Pick File', function: controller.pickFile),
        AdminFunctions.itemButton(text: 'Save File', function: controller.saveFile),
      ], title: 'Files');

  _permissions() => AdminFunctions.section([
        AdminFunctions.itemButton(text: 'Check All Permissions', function: controller.checkAllPermissions),
        AdminFunctions.itemButton(text: 'Ask All Permissions', function: controller.askAllPermissions),
      ], title: 'Permissions');

  _notifications() => Column(children: [
        AdminFunctions.sectionGrid(items: [
          AdminFunctions.itemButton(text: 'Local Notification', function: controller.showLocalNotification),
          AdminFunctions.itemButton(text: 'Push Notification', function: controller.showPushNotification),
        ], title: 'Notifications'),
      ]);

  _appData() => Column(children: [
        AdminFunctions.sectionGrid(items: [
          AdminFunctions.itemButton(text: 'Save Appdata', function: controller.saveAppDataTest),
          AdminFunctions.itemButton(text: 'Load AppData', function: controller.loadAppDataTest),
          AdminFunctions.itemButton(text: 'Import AppData', function: controller.importAppDataTest),
          AdminFunctions.itemButton(text: 'Export AppData', function: controller.exportAppDataTest),
        ], title: 'AppData - Save and Load'),
      ]);
}
