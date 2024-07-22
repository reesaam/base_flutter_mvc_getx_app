import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_mvc_getx_app/app/functional_components/connectivity/connectivity.dart';
import 'package:flutter_base_mvc_getx_app/features/versions/data/versions_remote_data_source.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/general_widgets/app_snack_bars.dart';
import '../data/info/app_info.dart';
import '../data/storage/app_local_storage.dart';
import '../features/versions/data/versions_local_data_source.dart';
import '../features/versions/models/app_version/app_version.dart';
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
  AppVersionsList? versions;
  var internetAvailability = await ConnectionChecker().checkInternet();
  if (internetAvailability) {
    var remoteResponse = await VersionsRemoteDataSource().getVersions();
    var localResponse = await VersionsLocalDataSource().getVersions();
    var response = remoteResponse.isRight() ? remoteResponse : localResponse;
    versions = response.fold((l) => null, (r) => r);
  } else {
    popPage();
    await AppAlertDialogs().withOk(title: Texts.to.connectionInternetNotAvailableTitle, text: Texts.to.connectionInternetNotAvailableText, onTapOk: popPage);
  }

  return versions;
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
  AppVersionsList? versions = await getVersions();
  AppVersion version = versions == null ? AppVersion.createEmpty() : versions.versionsList.last;
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
