import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/resources/app_colors.dart';
import '../../data/resources/app_paddings.dart';
import '../core_functions.dart';
import '../core_widgets.dart';
import 'core_controller.dart';

abstract class CoreView<Controller extends CoreController> extends GetView<Controller> {
  const CoreView({super.key});

  ///Main Widgets
  PreferredSizeWidget? get appBar => null;
  Widget? get drawer => null;
  Widget get body;
  Widget? get topBar => null;
  Widget? get footer => null;
  Widget? get bottomNavigationBar => null;
  Widget? get floatingActionButton => null;

  ///Variables
  EdgeInsets? get pagePadding => null;

  @override
  Widget build(BuildContext context) => PopScope(canPop: controller.pageDetail.bottomBarItemNumber == null, onPopInvoked: (didPop) => didPop == false ? appExitDialog() : null, child: _pageScaffold);

  Widget get _pageScaffold => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar,
        drawer: drawer,
        drawerEnableOpenDragGesture: true,
        drawerEdgeDragWidth: Get.width / 4,
        body: _pageBody,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        backgroundColor: AppColors.appBackground,
      );

  Widget get _pageBody => SafeArea(
        child: Column(children: [
          topBar == null ? shrinkSizedBox : topBar!,
          //Main Body
          Expanded(child: Padding(padding: pagePadding ?? AppPaddings.pages, child: SingleChildScrollView(scrollDirection: Axis.vertical, physics: const BouncingScrollPhysics(), child: body))),
          footer == null ? shrinkSizedBox : footer!,
        ]),
      );
}
