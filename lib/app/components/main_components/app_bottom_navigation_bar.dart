import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_extensions/data_types_extensions/extension_int.dart';
import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';
import '../../../core/app_routing/routing.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_enums.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  RxInt selectedIndex = 0.obs;

  void _onItemTap(int index) {
    selectedIndex.value = index;
    goToPage(AppBottomNavigationPages.values[index].appRoute);
    Get.reload();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex.value = widget.selectedIndex!;
    return BottomNavigationBar(
        backgroundColor: AppColors.bottomBarBackground,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        currentIndex: selectedIndex.value,
        onTap: (index) => _onItemTap(index),
        selectedItemColor: AppColors.bottomBarSelected,
        unselectedItemColor: AppColors.bottomBarUnselected,
        items: List<BottomNavigationBarItem>.generate(AppBottomNavigationPages.values.length, (index) => _generateBottomNavigationBarItem(AppBottomNavigationPages.values[index].appRoute)));
  }

  BottomNavigationBarItem _generateBottomNavigationBarItem(AppRoutes route) => BottomNavigationBarItem(
      activeIcon: CircleAvatar(backgroundColor: AppColors.appDefaultColorSecond, foregroundColor: AppColors.appDefaultColor, child: _createIcon(route).withColor(AppColors.textNormalLight)),
      icon: _createIcon(route),
      label: _createLabel(route));

  Icon _createIcon(AppRoutes route) => AppPageDetails().listPages.firstWhere((element) => element.pageRoute == route).iconCode.toIcon;

  String _createLabel(AppRoutes route) => AppPageDetails().listPages.firstWhere((element) => element.pageRoute == route).pageName ?? '';
}
