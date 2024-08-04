import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_localization.dart';
import '../../../core/elements/core_view.dart';
import '../../../data/info/app_info.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../controller/update_controller.dart';

class UpdatePage extends CoreView<UpdateController> {
  const UpdatePage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  Widget? get footer => Obx(() => _widgetButtons());

  @override
  Widget get body => Obx(() => Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _widgetVersions(),
      ]));

  Widget _widgetVersions() => Card(
      child: Container(
          padding: AppPaddings.updateVersions,
          child: Column(children: [
            _widgetVersion(Texts.to.updateCurrentVersion, AppInfo.currentVersion.version),
            AppSpaces.h10,
            _widgetVersion(
              Texts.to.updateAvailableVersion,
              controller.availableVersion.value == AppInfo.currentVersion.version ? Texts.to.notAvailable : controller.availableVersion.value,
            ),
          ])));

  Widget _widgetVersion(String title, String version) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(version)],
      );

  Widget _widgetButtons() => Container(
      padding: AppPaddings.updateButtons,
      child: Column(children: [
        AppGeneralButton(
          text: Texts.to.updateCheckUpdate,
          loading: controller.buttonCheckUpdateLoading.value,
          onTap: controller.checkUpdateFunction,
        ),
        AppGeneralButton(
          text: Texts.to.updateDownloadUpdate,
          loading: controller.buttonDownloadUpdateLoading.value,
          onTap: controller.downloadUpdate,
          disabled: controller.updateAvailability(),
        ),
      ]));
}
