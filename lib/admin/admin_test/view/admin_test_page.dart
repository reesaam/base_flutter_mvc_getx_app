import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';

import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_paddings.dart';
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
        _checkConnection(),
        _files(),
        _permissions(),
        _appData(),
      ]);

  _appPages() => _section(
      items: List.generate(
          AppPageDetails().listPages.length,
          (index) => AppGeneralButton(
                text: AppPageDetails().listPages[index].pageName ?? 'Unknown',
                onTap: () => goToPage(AppPageDetails().listPages[index].pageRoute),
              )),
      title: 'App All Pages',
      isGrid: true);

  _checkConnection() => _section(items: [
        _item(text: 'Connection Status', function: controller.internetConnection),
        _item(text: 'Internet Connection', function: controller.internetStatus),
        _item(text: 'Internet Status', function: controller.checkConnection),
      ], title: 'Connections', isGrid: true);

  _files() => _section(items: [
        _item(text: 'Pick File', function: controller.pickFile),
        _item(text: 'Save File', function: controller.saveFile),
      ], title: 'Files', isGrid: true);

  _permissions() => _section(items: [
        _item(text: 'Check All Permissions', function: controller.checkAllPermissions),
        _item(text: 'Ask All Permissions', function: controller.askAllPermissions),
      ], title: 'Permissions');

  _appData() => Column(children: [
        _section(items: [
          _item(text: 'Save Appdata', function: controller.saveAppData),
          _item(text: 'Load AppData', function: controller.loadAppData),
          _item(text: 'Import AppData', function: controller.importAppData),
          _item(text: 'Export AppData', function: controller.exportAppData),
        ], title: 'AppData - Save and Load', isGrid: true),
      ]);

  _section({required List<Widget> items, required String title, bool? isGrid}) => Column(children: [
        Column(children: [Text(title, style: const TextStyle(fontSize: 20)), AppDividers.settings]),
        Padding(
            padding: AppPaddings.buttonXLarge,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: items.length > 1 && isGrid == true ? 4 : 8,
              crossAxisCount: items.length > 1 && isGrid == true ? 2 : 1,
              children: List<Widget>.generate(items.length, (index) => items[index]),
            )),
        AppDividers.general(),
      ]);

  _item({required String text, required Function function}) => AppGeneralButton(text: text, onTap: () => function());
}
