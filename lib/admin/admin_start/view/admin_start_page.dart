import 'package:flutter/material.dart';

import '../../../core/app_localization_texts.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_elements/core_view.dart';
import '../../../ui_kit/buttons/app_general_button.dart';
import '../../../ui_kit/core_widgets.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../controller/admin_start_controller.dart';

class AdminStartPage extends CoreView<AdminStartController> {
  const AdminStartPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget get body => Column(children: [
        _sectionsButtons(),
      ]);

  _sectionsButtons() => Container(
      padding: AppPaddings.buttonLarge,
      child: Column(
          children: List<Widget>.generate(
              AppPageDetails().listAdminPages.length,
              (index) => index == 0
                  ? shrinkSizedBox
                  : AppGeneralButton(
                      text: controller.pages[index].pageName ?? Texts.to.notAvailableInitials,
                      onTap: () => goToPage(controller.pages[index].pageRoute),
                    ))));
}
