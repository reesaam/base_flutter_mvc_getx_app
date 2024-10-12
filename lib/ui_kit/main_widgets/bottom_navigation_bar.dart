import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../shared/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../core/core_resources/core_enums.dart';
import '../../core/core_resources/page_details.dart';
import '../../core/extensions/extensions_on_data_types/extension_int.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int? selectedIndex;
  const AppBottomNavigationBar({super.key, this.selectedIndex});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  RxInt selectedIndex = 0.obs;
  List<AppPageDetail> pagesList = AppPageDetails.listPages.where((element) => element.bottomBarItemNumber != null).toList();

  @override
  void initState() {
    pagesList.sort((a, b) => a.bottomBarItemNumber!.compareTo(b.bottomBarItemNumber!));
    super.initState();
  }

  void _onItemTap(int index) {
    selectedIndex.value = index;
    goToPage(pagesList[index]);
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex.value = widget.selectedIndex ?? 0;
    return BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) => _onItemTap(index),
        items: List<BottomNavigationBarItem>.generate(
          pagesList.length,
          (index) => _generateBottomNavigationBarItem(pagesList[index]),
        ));
  }

  BottomNavigationBarItem _generateBottomNavigationBarItem(AppPageDetail page) => BottomNavigationBarItem(
        icon: _createIcon(page),
        label: _createLabel(page),
      );

  Icon _createIcon(AppPageDetail page) => pagesList.singleWhere((element) => element == page).iconCode.toIcon();

  String _createLabel(AppPageDetail page) => pagesList.singleWhere((element) => element == page).pageName ?? Texts.to.empty;
}
