import 'package:flutter/material.dart';

import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_string.dart';
import '../../../core/app_localization.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';

import '../../../data/info/app_defaults.dart';
import '../../../data/info/app_info.dart';
import '../../../data/resources/app_enums.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_spaces.dart';
import '../../../data/resources/app_theme/app_themes.dart';
import '../../../data/resources/app_theme/app_themes_variables.dart';
import '../controller/admin_app_resources_controller.dart';

class AdminAppResourcesPage extends CoreView<AdminAppResourcesController> {
  const AdminAppResourcesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.general(),
        _appDefaults(),
        _appAPIs(),
        _appTheme(),
        _appColorsLight(),
        _appColorsDark(),
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

  _appTheme() => _section([
        _itemWidget(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      _itemWidget(title: 'Canvas Color', widget: _colorWidget(AppThemes.to.canvasColor)),
                      _itemWidget(title: 'Primary Color', widget: _colorWidget(AppThemes.to.primaryColor)),
                      _itemWidget(title: 'Primary Dark Color', widget: _colorWidget(AppThemes.to.primaryColorDark)),
                    ]))),
            fullWidth: true)
      ], title: 'Theme');

  _appColorsLight() => _section([
        _itemWidget(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      _itemWidget(title: 'Background', widget: _colorWidget(AppThemesVariables.appBackground)),
                      _itemWidget(title: 'Primary', widget: _colorWidget(AppThemesVariables.appPrimary)),
                      _itemWidget(title: 'Secondary', widget: _colorWidget(AppThemesVariables.appSecondary)),
                      _itemWidget(title: 'Tertiary', widget: _colorWidget(AppThemesVariables.appTertiary)),
                      _itemWidget(title: 'Disabled', widget: _colorWidget(AppThemesVariables.appDisabled)),
                      _itemWidget(title: 'Error', widget: _colorWidget(AppThemesVariables.appError)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors - Light');

  _appColorsDark() => _section([
        _itemWidget(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      _itemWidget(title: 'Background', widget: _colorWidget(AppThemesVariables.appBackgroundDark)),
                      _itemWidget(title: 'Primary', widget: _colorWidget(AppThemesVariables.appPrimaryDark)),
                      _itemWidget(title: 'Secondary', widget: _colorWidget(AppThemesVariables.appSecondaryDark)),
                      _itemWidget(title: 'Tertiary', widget: _colorWidget(AppThemesVariables.appTertiaryDark)),
                      _itemWidget(title: 'Disabled', widget: _colorWidget(AppThemesVariables.appDisabledDark)),
                      _itemWidget(title: 'Error', widget: _colorWidget(AppThemesVariables.appErrorDark)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors - Dark');

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
        AppDividers.generalWithDisabledColor,
      ]);

  _item({String? title, String? text}) => Padding(
      padding: AppPaddings.buttonLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title?.withDoubleDots ?? Texts.to.empty),
        Text(text ?? Texts.to.empty),
      ]));

  _itemWidget({String? title, Widget? widget, bool? fullWidth}) => Column(children: [
        Padding(
            padding: fullWidth == true ? AppPaddings.zero : AppPaddings.buttonXLarge,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: fullWidth == true ? AppPaddings.zero : const EdgeInsets.symmetric(horizontal: 5),
                child: widget ?? shrinkSizedBox,
              ),
              title == null ? shrinkSizedBox : AppSpaces.h10,
              title == null ? shrinkSizedBox : Text(title, textAlign: TextAlign.center),
            ])),
      ]);

  _colorWidget(Color color) => CircleAvatar(
    minRadius: 20,
    maxRadius: 20,
    backgroundColor: Colors.white,
    child: CircleAvatar(
        minRadius: 20,
        maxRadius: 20,
        backgroundColor: Colors.black,
        child: CircleAvatar(
          minRadius: 18,
          maxRadius: 18,
          backgroundColor: color,

        )),
  );
}
