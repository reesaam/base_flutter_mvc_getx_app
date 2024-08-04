import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';

class AdminAppResourcesController extends CoreController {
  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminAppResourcesPage;
  }

  Widget colorWidget(Color color) => CircleAvatar(
      minRadius: 20,
      maxRadius: 20,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        minRadius: 18,
        maxRadius: 18,
        backgroundColor: color,
      ));
}
