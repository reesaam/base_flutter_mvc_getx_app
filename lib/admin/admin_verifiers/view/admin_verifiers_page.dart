import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../core/verifiers/regexes.dart';
import '../../../ui_kit/general_widgets/app_text_field.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_verifiers_controller.dart';

class AdminVerifiersPage extends CoreView<AdminVerifiersController> {
  const AdminVerifiersPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.generalWithDisabledColor,
        _textFields(),
      ]);

  _textFields() => Obx(() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'Phone',
            widget: AppTextField(
              hint: '0987654321',
              label: controller.mobile.value,
              controller: controller.mobileController,
              regexValidator: AppRegexes.phoneNumber,
            )),
        AdminFunctions.item(
            title: 'Email',
            widget: AppTextField(
              hint: 'r@r.R',
              label: controller.email.value,
              controller: controller.emailController,
              regexValidator: AppRegexes.email,
            )),
    AdminFunctions.item(
        title: 'Numeric',
        widget: AppTextField(
          hint: '123456',
          label: controller.numeric.value,
          controller: controller.numericController,
          regexValidator: AppRegexes.numeric,
        )),
      ], title: 'Verifiers'));
}
