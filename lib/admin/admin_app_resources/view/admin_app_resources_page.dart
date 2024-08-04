import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';

import '../../../data/info/app_defaults.dart';
import '../../../data/info/app_info.dart';
import '../../../data/resources/app_colors.dart';
import '../../../data/resources/app_enums.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../controller/admin_app_resources_controller.dart';

class AdminAppResourcesPage extends CoreView<AdminAppResourcesController> {
  const AdminAppResourcesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.general,
        _appDefaults(),
        _appAPIs(),
        _appColors(),
      ]);

  _appDefaults() => _section([
        _item(title: 'Font Size', text: appDefaultFontSize.toInt().toString()),
        _item(title: 'Connection Timeout', text: appDefaultConnectionTimeOut.inSeconds.toString()),
        _item(title: 'Circular Progress Bar Width', text: defaultCircularProgressBarWidth.toInt().toString()),
        _item(title: 'SnackBar Animation Duration', text: appSnackBarDefaultAnimationDuration.inSeconds.toInt().toString()),
        _item(title: 'SnackBar Duration', text: appSnackBarDefaultDuration.inSeconds.toInt().toString()),
        _item(title: 'Snack Position', text: appDefaultSnackPosition.toString().split('.').last),
        _item(title: 'Border Width', text: appDefaultBorderWidth.toInt().toString()),
      ], title: 'App Defaults');

  _appColors() => _section([
        _itemWidget(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      _itemWidget(title: 'Background', widget: controller.colorWidget(AppColors.appBackground)),
                      _itemWidget(title: 'Primary', widget: controller.colorWidget(AppColors.appPrimary)),
                      _itemWidget(title: 'Secondary', widget: controller.colorWidget(AppColors.appSecondary)),
                      _itemWidget(title: 'Tertiary', widget: controller.colorWidget(AppColors.appTertiary)),
                      _itemWidget(title: 'Light', widget: controller.colorWidget(AppColors.appLight)),
                      _itemWidget(title: 'Dark', widget: controller.colorWidget(AppColors.appDark)),
                      _itemWidget(title: 'Disabled', widget: controller.colorWidget(AppColors.appDisabled)),
                      _itemWidget(title: 'On Disabled', widget: controller.colorWidget(AppColors.appOnDisabled)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors');

  _appAPIs() => _section([
        _item(title: 'Base URL', text: AppInfo.baseUrl),
        _item(title: 'API Version', text: APIVersions.v1.getValue),
        _item(title: 'API URL', text: 'https://${AppInfo.baseUrl}/${APIVersions.v1.getValue}'),
      ], title: 'App APIs');

  _section(List<Widget> section, {String? title}) => Column(children: [
        title == null
            ? shrinkSizedBox
            : Column(children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                AppDividers.settings,
              ]),
        Column(children: section),
        AppDividers.general,
      ]);

  _item({String? title, String? text}) => Padding(
      padding: AppPaddings.buttonLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title?.withDoubleDots ?? ''),
        Text(text ?? ''),
      ]));

  _itemWidget({String? title, Widget? widget, bool? primary, bool? fullWidth}) => Column(children: [
        Padding(
            padding: fullWidth == true ? AppPaddings.zero : AppPaddings.buttonXLarge,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: fullWidth == true ? AppPaddings.zero : const EdgeInsets.symmetric(horizontal: 5),
                color: primary == true ? AppColors.appSecondary : null,
                child: widget ?? shrinkSizedBox,
              ),
              title == null ? shrinkSizedBox : AppSpaces.h10,
              title == null ? shrinkSizedBox : Text(title, textAlign: TextAlign.center),
            ])),
      ]);
}
