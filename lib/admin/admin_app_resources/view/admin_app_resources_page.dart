import 'package:flutter/material.dart';

import '../../../core/core_elements/core_view.dart';
import '../../../core/core_info/app_info.dart';
import '../../../core/core_resources/core_enums.dart';
import '../../../core/core_resources/defaults.dart';
import '../../../ui_kit/general_widgets/dividers.dart';
import '../../../ui_kit/main_widgets/app_bar.dart';
import '../../../ui_kit/resources/paddings.dart';
import '../../../ui_kit/theme/themes.dart';
import '../../../ui_kit/theme/themes_variables.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_app_resources_controller.dart';

class AdminAppResourcesPage extends CoreView<AdminAppResourcesController> {
  const AdminAppResourcesPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(children: [
        AppDividers.generalWithDisabledColor,
        _appDefaults(),
        _appAPIs(),
        _appTheme(),
        _appColorsLight(),
        _appColorsDark(),
      ]);

  _appDefaults() => AdminFunctions.section([
        AdminFunctions.item(title: 'Font Size', text: appDefaultFontSize.toInt().toString()),
        AdminFunctions.item(title: 'Connection Timeout', text: appDefaultConnectionTimeOut.inSeconds.toString()),
        AdminFunctions.item(title: 'Circular Progress Bar Width', text: defaultCircularProgressBarWidth.toInt().toString()),
        AdminFunctions.item(title: 'SnackBar Animation Duration', text: appSnackBarDefaultAnimationDuration.inSeconds.toInt().toString()),
        AdminFunctions.item(title: 'SnackBar Duration', text: appSnackBarDefaultDuration.inSeconds.toInt().toString()),
        AdminFunctions.item(title: 'Snack Position', text: appDefaultSnackPosition.toString().split('.').last),
        AdminFunctions.item(title: 'Border Width', text: appDefaultBorderWidth.toInt().toString()),
      ], title: 'App Defaults');

  _appTheme() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      AdminFunctions.item(title: 'Canvas Color', widget: _colorWidget(AppThemes.to.canvasColor)),
                      AdminFunctions.item(title: 'Primary Color', widget: _colorWidget(AppThemes.to.primaryColor)),
                      AdminFunctions.item(title: 'Primary Dark Color', widget: _colorWidget(AppThemes.to.primaryColorDark)),
                    ]))),
            fullWidth: true)
      ], title: 'Theme');

  _appColorsLight() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      AdminFunctions.item(title: 'Background', widget: _colorWidget(AppThemesVariables.appBackground)),
                      AdminFunctions.item(title: 'Primary', widget: _colorWidget(AppThemesVariables.appPrimary)),
                      AdminFunctions.item(title: 'Secondary', widget: _colorWidget(AppThemesVariables.appSecondary)),
                      AdminFunctions.item(title: 'Tertiary', widget: _colorWidget(AppThemesVariables.appTertiary)),
                      AdminFunctions.item(title: 'Disabled', widget: _colorWidget(AppThemesVariables.appDisabled)),
                      AdminFunctions.item(title: 'Error', widget: _colorWidget(AppThemesVariables.appError)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors - Light');

  _appColorsDark() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
                trackVisibility: true,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(children: [
                      AdminFunctions.item(title: 'Background', widget: _colorWidget(AppThemesVariables.appBackgroundDark)),
                      AdminFunctions.item(title: 'Primary', widget: _colorWidget(AppThemesVariables.appPrimaryDark)),
                      AdminFunctions.item(title: 'Secondary', widget: _colorWidget(AppThemesVariables.appSecondaryDark)),
                      AdminFunctions.item(title: 'Tertiary', widget: _colorWidget(AppThemesVariables.appTertiaryDark)),
                      AdminFunctions.item(title: 'Disabled', widget: _colorWidget(AppThemesVariables.appDisabledDark)),
                      AdminFunctions.item(title: 'Error', widget: _colorWidget(AppThemesVariables.appErrorDark)),
                    ]))),
            fullWidth: true)
      ], title: 'App Colors - Dark');

  _appAPIs() => AdminFunctions.section([
        AdminFunctions.item(title: 'Base URL', text: AppInfo.baseUrl),
        AdminFunctions.item(title: 'API Version', text: APIVersions.v1.getValue),
        AdminFunctions.item(title: 'API URL', text: 'https://${AppInfo.baseUrl}/${APIVersions.v1.getValue}'),
      ], title: 'App APIs');

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
