import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/app_localization_texts.dart';
import '../../core/core_functions.dart';
import '../../core/core_info/app_info.dart';
import '../../core/core_info/core_defaults.dart';
import '../../core/core_models/core_models/app_data/app_data.dart';
import '../../core/core_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../core/core_resources/core_enums.dart';
import '../../core/core_resources/texts.dart';
import '../../core/extensions/extensions_on_data_types/extension_date_time.dart';
import '../../core/extensions/extensions_on_data_types/extension_duration.dart';
import '../../core/extensions/extensions_on_data_types/extension_string.dart';
import '../../features/settings/models/app_settings_data/app_setting_data.dart';
import '../../features/versions/models/app_version/app_version.dart';
import '../failures/local_exception.dart';
import '../file_functions/file_functions.dart';
import 'storage_providers/app_local_storage.dart';
import 'storage_providers/app_shared_preferences.dart';

class AppStorage {
  final _storage = switch (CoreDefaults.defaultStorageProvider) {
    AppStorageProvider.getStorage => AppLocalStorage(),
    AppStorageProvider.sharedPreferences => AppSharedPreferences(),
  };

  static AppStorage get to => Get.find();

  ///Keys
  final _keyAppData = AppStorageKeys.keyAppData;
  final _keyAppStatisticData = AppStorageKeys.keyAppStatisticsData;
  final _keyAppDataVersion = AppStorageKeys.keyAppDataVersion;
  final _keyAppVersions = AppStorageKeys.keyAppVersions;
  final _keySettings = AppStorageKeys.keySettings;

  Either<LocalException, bool> clearStorage() {
    Either<LocalException, bool>? response;
    _storage.clearStorage().then((value) => response = value);
    return response ?? const Right(false);
  }

  ///AppData
  Future<bool> saveAppData({required AppData? appData}) async {
    final response = await _storage.saveData(key: _keyAppData, data: appData);
    return response.fold((l) => false, (r) => r);
  }

  Future<AppData?> loadAppData() async {
    final response = await _storage.loadData(key: _keyAppData);
    final result = response.map((r) => r == null ? const AppData() : AppData.fromJson(r));
    return result.fold((l) => null, (r) => r);
  }

  Future<Either<LocalException, bool>> clearAppData() async => await _storage.clearSpecificKey(_keyAppData);

  ///AppDataVersion
  Future<Either<LocalException, bool>> saveAppDataVersion({required AppDataVersions? appDataVersion}) async =>
      await _storage.saveData(key: _keyAppDataVersion, data: appDataVersion);

  Future<Either<LocalException, AppDataVersions?>> loadAppDataVersion() async {
    final response = await _storage.loadData(key: _keyAppDataVersion);
    final result = response.map((r) => r == null ? null : AppDataVersions.values.firstWhere((element) => element.name == jsonDecode(r)));
    return result;
  }

  Future<Either<LocalException, bool>> clearAppDataVersion() async => await _storage.clearSpecificKey(_keyAppDataVersion);

  ///AppVersion
  Future<Either<LocalException, bool>> saveAppVersions({required AppVersionsList? appVersions}) async =>
      await _storage.saveData(key: _keyAppVersions, data: appVersions);

  Future<Either<LocalException, AppVersionsList>> loadAppVersions() async {
    final response = await _storage.loadData(key: _keyAppVersions);
    final result = response.map((r) => r == null ? AppVersionsList() : AppVersionsList.fromJson(r));
    return result;
  }

  Future<Either<LocalException, bool>> clearAppVersion() async => await _storage.clearSpecificKey(_keyAppVersions);

  ///AppStatisticsData
  Future<Either<LocalException, bool>> saveAppStatisticsData({required AppStatisticsData? appStatisticsData}) async =>
      await _storage.saveData(key: _keyAppStatisticData, data: appStatisticsData);
  Future<Either<LocalException, AppStatisticsData?>> loadAppStatisticsData() async {
    final response = await _storage.loadData(key: _keyAppStatisticData);
    final result = response.map((r) => r == null ? AppStatisticsData.init() : AppStatisticsData.fromJson(r));
    return result;
  }

  Future<Either<LocalException, bool>> clearAppStatisticsData() async => await _storage.clearSpecificKey(_keyAppStatisticData);

  ///Settings
  Future<Either<LocalException, bool>> saveSettings({required AppSettingData? settings}) async {
    final response = await _storage.saveData(key: _keySettings, data: settings);
    return response;
  }

  Future<Either<LocalException, AppSettingData>> loadSettings() async {
    final response = await _storage.loadData(key: _keySettings);
    final result = response.map((r) => r == null ? const AppSettingData() : AppSettingData.fromJson(r));
    return result;
  }

  Future<Either<LocalException, bool>> clearSettings() async => await _storage.clearSpecificKey(_keySettings);

  ///Manage Data
  Future<void> exportData() async {
    final settingsData = await loadSettings();
    final statisticsData = await loadAppStatisticsData();

    AppData appData = AppData(
      dataVersion: AppDataVersions.values.last,
      appVersions: AppInfo.versions,
      settings: settingsData.fold((l) => null, (r) => r),
      statisticsData: statisticsData.fold((l) => null, (r) => r),
    );

    var appDataJson = appData.toJson();
    Uint8List data = appDataJson.toString().toUInt8List();
    String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
    appLogPrint('File Path: $savedPath');
    appLogPrint('Backup File Exported');
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions.to.pickFile();

    if (appDataFile != null) {
      clearAppData();
      String stringCharCodes = String.fromCharCodes(appDataFile.readAsBytesSync());
      AppData appData = AppData.fromJson(json.decode(stringCharCodes));

      ///Filling Data Fields
      if (appData.dataVersion == AppDataVersions.values.last) {
        saveAppData(appData: appData);
        appLogPrint('Data Imported');
      } else {
        appLogPrint('Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
      }
    } else {
      appDebugPrint('Imported File was NUll');
    }
  }

  void printData({AppData? appData, bool? detailsIncluded}) {
    String unknown = Texts.to.notAvailableInitials;

    if (appData != null) {
      appLogPrint('==> App Data:');
      appLogPrint('App Version: ${appData.appVersions?.versionsList.lastOrNull?.version ?? unknown}');
      detailsIncluded == true ? appLogPrint('App Version Type: ${appData.appVersions?.versionsList.lastOrNull?.versionType ?? unknown}') : null;
      appLogPrint('App Data Type: ${appData.dataVersion?.number ?? unknown}');
      if (detailsIncluded == true) {
        appLogPrint('==> Details:');
        appLogPrint('Settings / Dark Mode: ${appData.settings?.darkMode}');
        appLogPrint('Settings / Language: ${appData.settings?.language?.languageName}');
      }
    }

    if (appData?.statisticsData != null) {
      appLogPrint('==> Statistics:');
      appLogPrint('Statistics / Launches: ${appData?.statisticsData?.launches}');
      appLogPrint('Statistics / Logins: ${appData?.statisticsData?.logins}');
      appLogPrint('Statistics / Crashes: ${appData?.statisticsData?.crashes}');
      appLogPrint('Statistics / Page Opens: ${appData?.statisticsData?.pageOpens}');
      appLogPrint('Statistics / API Calls: ${appData?.statisticsData?.apiCalls}');
      appLogPrint('Statistics / Install DateTime: ${appData?.statisticsData?.installDateTime.toDateTimeFormat}');
      appLogPrint('Statistics / Install Duration: ${appData?.statisticsData?.installDuration.toConditionalFormat}');
    }
  }
}
