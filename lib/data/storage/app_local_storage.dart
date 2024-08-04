import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../core/app_extensions/data_types_extensions/extension_date_time.dart';
import '../../core/app_extensions/data_types_extensions/extension_duration.dart';
import '../../core/failures/local_exception.dart';
import '../../data/info/app_info.dart';
import '../../core/app_extensions/data_types_extensions/extension_string.dart';
import '../../app/functional_components/file_functions/file_functions.dart';
import '../../core/app_localization.dart';
import '../../core/core_functions.dart';
import '../../features/settings/models/app_settings_data/app_setting_data.dart';
import '../../features/versions/models/app_version/app_version.dart';
import '../models/core_models/app_data/app_data.dart';
import '../models/core_models/app_statistics_data/app_statistics_data.dart';
import '../resources/app_enums.dart';
import '../resources/app_texts.dart';
import 'app_shared_preferences.dart';
import 'local_storage_service.dart';

class AppLocalStorage {
  final String _keyLocalStorage = 'Local Storage';
  final _storage = LocalStorageService();

  static AppLocalStorage get to => Get.find();

  ///Keys
  final _keyAppData = AppStorageKeys.keyAppData.name;
  final _keyAppStatisticData = AppStorageKeys.keyAppStatisticsData.name;
  final _keyAppDataVersion = AppStorageKeys.keyAppDataVersion.name;
  final _keyAppVersions = AppStorageKeys.keyAppVersions.name;
  final _keySettings = AppStorageKeys.keySettings.name;

  void clearStorage() {
    for (var key in AppStorageKeys.values) {
      _clearSpecificKey(key);
    }
    AppSharedPreferences.to.clearData();
    appLogPrint('All App Data Cleared');
  }

  void _clearSpecificKey(AppStorageKeys key) => _storage.remove(key.name);

  ///Core Functions
  Future<Either<LocalException, bool>> _saveFunction({required String key, data}) async {
    try {
      data == null ? null : await _storage.write(key, data);
      return const Right(true);
    } on LocalException catch (ex) {
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      return Left(LocalException.handleResponse(ex));
    }
  }

  Either<LocalException, T> _loadFunction<T>(String key) {
    try {
      T data = _storage.read(key);
      return Right(data);
    } on LocalException catch (ex) {
      return Left(LocalException.handleResponse(ex));
    } catch (ex) {
      return Left(LocalException.handleResponse(ex));
    }
  }

  Future<void> saveAllDataToStorage() async {
    //Load data
    AppDataVersions? appDataVersion = loadAppDataVersion().fold((l) => null, (r) => r);
    AppVersionsList? appVersions = loadAppVersions().fold((l) => null, (r) => r);
    AppSettingData? settings = loadSettings().fold((l) => null, (r) => r);

    //Fill Data
    AppData appData = AppData(
      version: appDataVersion,
      appVersions: appVersions,
      settings: settings,
    );

    AppSharedPreferences.to.saveData(appData);
    appLogPrint('AppData Saved to Storage Successfully');
  }

  Future<AppData?> loadAllDataFromStorage() async {
    AppData? appData = await AppSharedPreferences.to.loadData();

    if (appData == null) {
    } else {
      saveAppDataVersion(appDataVersion: appData.version);
      saveAppVersions(appVersions: appData.appVersions);
      saveSettings(settings: appData.settings);
    }

    appLogPrint('AppData Loaded from Storage Successfully');
    return appData;
  }

  ///Manage Data
  Future<void> exportData() async {
    AppData appData = AppData(
      version: AppDataVersions.values.last,
      appVersions: AppInfo.versions,
      settings: loadSettings().fold((l) => null, (r) => r),
    );

    var appDataJson = json.encode(appData);
    Uint8List data = appDataJson.toString().toUInt8List;
    String? savedPath = await AppFileFunctions.to.saveFile(fileName: AppTexts.settingBackupFilename, data: data);
    appLogPrint('File Path: $savedPath');
    appLogPrint('Backup File Exported');
  }

  Future<void> importData() async {
    var appDataFile = await AppFileFunctions.to.pickFile();

    if (appDataFile != null) {
      var fileString = String.fromCharCodes(appDataFile.readAsBytesSync());
      var decodedFile = json.decode(fileString);
      AppData appData = AppData.fromJson(decodedFile);
      clearAppData();

      ///Filling Data Fields
      if (appData.version == AppDataVersions.values.last) {
        await saveSettings(settings: appData.settings ?? const AppSettingData());
        appLogPrint('Data Imported');
      } else {
        appLogPrint('Data Version is not Compatible, Converter is not Implemented\nData Import Failed');
      }
    } else {
      appDebugPrint('Imported File was NUll');
    }
  }

  void printData({AppData? appData, AppStatisticsData? statisticsData, bool? detailsIncluded}) {
    String unknown = Texts.to.notAvailableInitials;

    if (appData != null) {
      appLogPrint('==> App Data:');
      appLogPrint('App Version: ${appData.appVersions?.versionsList.last.version ?? unknown}');
      detailsIncluded == true ? appLogPrint('App Version Type: ${appData.appVersions?.versionsList.last.versionType ?? unknown}') : null;
      appLogPrint('App Data Type: ${appData.version?.number ?? unknown}');
      if (detailsIncluded == true) {
        appLogPrint('==> Details:');
        appLogPrint('Settings / Dark Mode: ${appData.settings?.darkMode}');
        appLogPrint('Settings / Language: ${appData.settings?.language.languageName}');
      }
    }

    if (statisticsData != null) {
      appLogPrint('==> Statistics:');
      appLogPrint('Statistics / Launches: ${statisticsData.launches}');
      appLogPrint('Statistics / Logins: ${statisticsData.logins}');
      appLogPrint('Statistics / Crashes: ${statisticsData.crashes}');
      appLogPrint('Statistics / Install DateTime: ${statisticsData.installDateTime.toDateTimeFormat}');
      appLogPrint('Statistics / Install Duration: ${statisticsData.installDuration.toConditionalFormat}');
    }

  }

  ///AppStatisticsData
  Future<void> saveAppStatisticsData({required AppStatisticsData? appStatisticsData}) async => await _saveFunction(key: _keyAppStatisticData, data: appStatisticsData);
  Either<LocalException, AppStatisticsData?> loadAppStatisticsData() => _loadFunction(_keyAppStatisticData).map((r) => r == null ? AppStatisticsData.init() : AppStatisticsData.fromJson(r));
  clearAppStatisticsData() => _clearSpecificKey(AppStorageKeys.keyAppStatisticsData);

  ///AppDataVersion
  Future<void> saveAppDataVersion({required AppDataVersions? appDataVersion}) async => await _saveFunction(key: _keyAppDataVersion, data: appDataVersion);
  Either<LocalException, AppDataVersions?> loadAppDataVersion() => _loadFunction(_keyAppDataVersion).map((r) => r == null ? null : jsonDecode(r));
  clearAppDataVersion() => _clearSpecificKey(AppStorageKeys.keyAppDataVersion);

  ///AppVersion
  Future<void> saveAppVersions({required AppVersionsList? appVersions}) async => await _saveFunction(key: _keyAppVersions, data: appVersions);
  Either<LocalException, AppVersionsList> loadAppVersions() => _loadFunction(_keyAppVersions).map((r) => r == null ? AppVersionsList() : AppVersionsList.fromJson(r));
  clearAppVersion() => _clearSpecificKey(AppStorageKeys.keyAppVersions);

  ///Settings
  Future<void> saveSettings({required AppSettingData? settings}) async => await _saveFunction(key: _keySettings, data: settings);
  Either<LocalException, AppSettingData> loadSettings() => _loadFunction(_keySettings).map((r) => r == null ? AppSettingData.createEmpty() : AppSettingData.fromJson(r));
  clearSettings() => _clearSpecificKey(AppStorageKeys.keySettings);
}
