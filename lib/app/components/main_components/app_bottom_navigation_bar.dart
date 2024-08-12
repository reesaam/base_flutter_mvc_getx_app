import 'package:base_flutter_all_app/core/app_extensions/data_types_extensions/extension_icon.dart';
import 'package:base_flutter_all_app/data/models/core_models/app_page_detail/app_page_detail.dart';
import 'package:base_flutter_all_app/data/resources/app_theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_enums.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  RxInt selectedIndex = 0.obs;
  List<AppPageDetail> pagesList = AppPageDetails().listPages.where((element) => element.bottomBarItemNumber != null).toList();

  @override
  void initState() {
    pagesList.sort((a, b) => a.bottomBarItemNumber!.compareTo(b.bottomBarItemNumber!));
    super.initState();
  }

  void _onItemTap(int index) {
    selectedIndex.value = index;
    goToPage(pagesList[index].pageRoute);
    // Get.reload();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex.value = widget.selectedIndex ?? 0;
    return BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) => _onItemTap(index),
        items: List<BottomNavigationBarItem>.generate(
          pagesList.length,
          (index) => _generateBottomNavigationBarItem(pagesList[index].pageRoute),
        ));
  }

  BottomNavigationBarItem _generateBottomNavigationBarItem(AppRoutes route) => BottomNavigationBarItem(
        activeIcon: CircleAvatar(
            backgroundColor: AppThemes.to.primaryColor,
            foregroundColor: AppThemes.to.canvasColor,
            child: _createIcon(route)),
        icon: _createIcon(route),
        label: _createLabel(route),
      );

  Icon _createIcon(AppRoutes route) => pagesList.singleWhere((element) => element.pageRoute == route).iconCode.toIcon;

  String _createLabel(AppRoutes route) => pagesList.singleWhere((element) => element.pageRoute == route).pageName ?? '';
}
