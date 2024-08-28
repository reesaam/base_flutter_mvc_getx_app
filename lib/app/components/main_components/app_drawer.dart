import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_extensions/extensions_on_data_types/extension_int.dart';
import '../../../core/app_localization_texts.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_functions.dart';
import '../../../data/info/app_info.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_logos.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_sizes.dart';
import '../../../data/resources/app_spaces.dart';
import '../general_widgets/app_dividers.dart';

class AppDrawer extends Drawer {
  const AppDrawer({super.key});

  @override
  double? get width => Get.width / 1.6;

  @override
  Widget? get child => SafeArea(
          child: Column(children: [
        header(),
        AppDividers.general(),
        Expanded(child: body()),
        AppDividers.general(),
        footer(),
      ]));

  Widget header() => Container(
      padding: AppPaddings.drawerHeader,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset(AppLogos.appLogo, width: AppSizes.drawerHeaderIconWidth),
        AppSpaces.w50,
        Text(AppInfo.appNameInitials, overflow: TextOverflow.ellipsis),
      ]));

  Widget body() {
    List<AppPageDetail> drawerList = AppPageDetails().listPages.where((element) => element.drawerPresence == true).toList();
    return Column(children: List.generate(drawerList.length, (index) => _bodyItem(drawerList[index])));
  }

  Widget _bodyItem(AppPageDetail page) => ListTile(title: Text(page.pageName ?? Texts.to.empty), leading: page.iconCode.toIcon(), onTap: () => {popPage(), goToPage(page.pageRoute)});

  Widget footer() => Container(
      padding: AppPaddings.drawerFooter,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        AppIcons.version,
        AppSpaces.w20,
        InkWell(onTap: () => goToUpdatePage(), child: Text('${Texts.to.version}: ${AppInfo.currentVersion.version}')),
      ]));
}
