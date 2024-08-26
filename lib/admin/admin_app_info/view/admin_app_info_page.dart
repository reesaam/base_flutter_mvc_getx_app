import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_date_time.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_duration.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_locale.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_string.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_time_zone.dart';
import '../../../core/app_localization.dart';
import '../../../core/core_widgets.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';

import '../../../data/info/app_core_flags.dart';
import '../../../data/info/app_developer_info.dart';
import '../../../data/info/app_info.dart';
import '../../../data/resources/app_paddings.dart';
import '../controller/admin_app_info_controller.dart';

class AdminAppInfoPage extends CoreView<AdminAppInfoController> {
  const AdminAppInfoPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Obx(() => Column(children: [
        AppDividers.general(),
        _appInfo(),
        _appDeveloperInfo(),
        _appStatisticsInfo(),
        _localization(),
      ]));

  _appInfo() => _section([
        _item(title: 'App Name', text: AppInfo.appName),
        _item(title: 'App Name Initials', text: AppInfo.appNameInitials),
        _item(title: 'Website', text: AppInfo.website),
        _item(title: 'Current Version', text: AppInfo.currentVersion.version),
        _item(title: 'Version Counter', text: AppInfo.versionsCounter.toString()),
        _item(title: 'Versions', text: AppInfo.versions.versionsList.toString()),
        _item(title: 'Base URL', text: AppInfo.baseUrl),
        _item(title: 'SubDomain', text: AppInfo.subDomain),
        _item(title: 'Is Release', text: isRelease.toString()),
        _item(title: 'Check Update', text: checkUpdate.toString()),
      ], title: 'App Info');

  _appDeveloperInfo() => _section([
        _item(title: 'Full Name', text: AppDeveloperInfo.fullName),
        _item(title: 'Website', text: AppDeveloperInfo.website),
        _item(title: 'LinkedIn', text: AppDeveloperInfo.linkedin),
      ], title: 'App Developer Info');

  _appStatisticsInfo() => _section([
        _item(title: 'Launches', text: controller.statisticsData.value.launches.toString()),
        _item(title: 'Logins', text: controller.statisticsData.value.logins.toString()),
        _item(title: 'Crashes', text: controller.statisticsData.value.crashes.toString()),
        _item(title: 'Install DateTime', text: controller.statisticsData.value.installDateTime?.toDateTimeFormat),
        _item(title: 'Install Duration', text: controller.statisticsData.value.installDuration?.toConditionalFormat),
        _item(title: 'Page Opens', text: controller.statisticsData.value.pageOpens.toString()),
        _item(title: 'Api Calls', text: controller.statisticsData.value.apiCalls.toString()),
      ], title: 'App Statistics Info');

  _localization() => _section([
    _item(title: 'Locale', text: AppLocalization.to.getDefaultLocale().toLanguageTag()),
    _item(title: 'Language Code', text: AppLocalization.to.getDefaultLocale().languageCode),
    _item(title: 'Language Name', text: AppLocalization.to.getDefaultLocale().getLanguageName),
    _item(title: 'Text Direction', text: AppLocalization.to.getTextDirection().name),
    _item(title: 'Country Name', text: AppLocalization.to.getTimeZone().countryName),
    _item(title: 'Country Code', text: AppLocalization.to.getDefaultLocale().countryCode ?? Texts.to.notAvailableInitials),
    _item(title: 'TimeZone Abbreviation', text: AppLocalization.to.getTimeZone().abbreviation),
    _item(title: 'TimeZone Offset', text: AppLocalization.to.getTimeZone().toFormattedOffset),
    _item(title: 'TimeZone DST', text: AppLocalization.to.getTimeZone().isDst.toString()),
    _item(title: 'Currency Sign', text: Texts.to.currencySign),
  ], title: 'Current Locale');

  _section(List<Widget> section, {String? title}) => Column(children: [
        title == null
            ? shrinkSizedBox
            : Column(children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                AppDividers.settings,
              ]),
        Column(children: section),
        AppDividers.general(),
      ]);

  _item({String? title, String? text}) => Padding(
      padding: AppPaddings.buttonLarge,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title?.withDoubleDots ?? Texts.to.empty),
        Text(text ?? Texts.to.empty),
      ]));
}
