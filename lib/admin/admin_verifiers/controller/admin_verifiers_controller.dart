import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization_texts.dart';
import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_resources/page_details.dart';

class AdminVerifiersController extends CoreController {

  TextEditingController generalController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numericController = TextEditingController();

  Rx<String> general = Texts.to.empty.obs;
  Rx<String> password = Texts.to.empty.obs;
  Rx<String> phone = Texts.to.empty.obs;
  Rx<String> email = Texts.to.empty.obs;
  Rx<String> numeric = Texts.to.empty.obs;

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.adminVerifiersPage;
  }
}
