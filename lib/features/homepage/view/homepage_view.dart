import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_icon_button.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../app/components/main_components/app_drawer.dart';
import '../../../data/info/app_core_flags.dart';
import '../../../data/resources/app_icons.dart';
import '../controller/homepage_controller.dart';

class HomePage extends CoreView<HomePageController> {
  const HomePage({super.key});

  @override
  PreferredSizeWidget? get appBar =>
      AppAppBar(pageDetail: controller.pageDetail, barAction: isRelease ? null : _adminPanelIcon());

  @override
  Widget? get drawer => const AppDrawer();

  @override
  Widget get body => Column();

  _adminPanelIcon() => AppIconButton(icon: AppIcons.adminPanelIcon, onTap: gotoAdminStartPage);
}
