import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/general_widgets/app_snack_bars.dart';
import '../data/info/app_info.dart';
import '../data/storage/app_local_storage.dart';
import '../features/version/model/models/app_version/app_version.dart';
import '../features/version/model/repositories/versions_repository.dart';
import '../features/version/model/repositories/versions_repository_impl.dart';
import 'app_localization.dart';

void appDebugPrint(message) => AppInfo.isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] ** $message **');

void popPage() {
  Get.back();
}

void saveAppData() => AppLocalStorage.to.saveAllDataToStorage();

void loadAppData() => AppLocalStorage.to.loadAllDataFromStorage();

void clearAppData() => AppLocalStorage.to.clearStorage();

Future<AppVersionsList?> getVersions() async {
  const VersionsRepository versionsRepository = VersionsRepositoryImpl();
  var response = await versionsRepository.getVersionsLocal();
  return response.fold((l) => null, (r) => r);
}

Future<String> checkAvailableVersion() async {
  String version = Texts.to.notAvailable;
  var response = await getVersions();
  if (response != null && response.versionsList.isNotEmpty) {
    version = response.versionsList.last.version;
  }
  return version;
}

Future<AppVersion> getCurrentVersion() async {
  VersionsRepository versionsRepository = const VersionsRepositoryImpl();
  AppVersion version = AppVersion.createEmpty();
  var response = await versionsRepository.getVersionsLocal();
  response.fold((l) => null, (r) => version = r.versionsList.last);
  return version;
}

noInternetConnectionSnackBar() => AppSnackBar().showSnackBar(message: Texts.to.connectionInternetNotAvailableText);

void appExitDialog() => AppAlertDialogs().withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

void appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  exit(0);
}
