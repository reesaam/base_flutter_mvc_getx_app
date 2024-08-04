import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../core/app_localization.dart';
import '../../../core/app_routing/app_routing.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_paddings.dart';
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
      padding: AppPaddings.buttonMedium,
      child: Column(
          children: List<Widget>.generate(
              AppPageDetails().listAdminPages.length,
              (index) => index == 0
                  ? shrinkSizedBox
                  : AppGeneralButton(
                      text: AppPageDetails().listAdminPages[index].pageName ?? Texts.to.notAvailableInitials,
                      onTap: () => goToPage(AppPageDetails().listAdminPages[index].pageRoute),
                    ))));
}
