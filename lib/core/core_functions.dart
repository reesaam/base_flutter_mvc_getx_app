import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/dialogs/app_alert_widget_dialogs.dart';
import '../app/components/general_widgets/app_progress_indicator.dart';
import '../app/components/general_widgets/app_snackbar.dart';
import '../app/functional_components/specific_dialogs/exceptions_dialog.dart';
import '../data/info/app_core_flags.dart';
import '../data/shared_models/core_models/app_data/app_data.dart';
import '../data/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../data/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../data/storage/app_local_storage.dart';
import '../features/versions/data/versions_local_data_source.dart';
import '../features/versions/data/versions_remote_data_source.dart';
import '../features/versions/models/app_version/app_version.dart';
import 'app_localization_texts.dart';
import 'failures/local_exception.dart';

void appDebugPrint(message) => isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] $message');

void popPage() {
  Get.back();
}

nullFunction() => null;

void saveAppData() => AppLocalStorage.to.saveAllDataToStorage();

Future<AppData?> loadAppData() => AppLocalStorage.to.loadAllDataFromStorage();

void clearAppData() => AppLocalStorage.to.clearStorage();

void printAllData({bool? detailsIncluded}) async {
  AppData? appData = await AppLocalStorage.to.loadAllDataFromStorage();
  AppStatisticsData? statisticsData =
      AppLocalStorage.to.loadAppStatisticsData().fold((l) => AppExceptionsDialog<LocalException>().local(exception: l), (r) => r);
  AppLocalStorage.to.printData(appData: appData, statisticsData: statisticsData, detailsIncluded: detailsIncluded);
}

Future<AppVersionsList?> getVersions() async {
  var remoteResponse = await VersionsRemoteDataSource().getVersions();
  var localResponse = await VersionsLocalDataSource().getVersions();
  var response = remoteResponse.isRight() ? remoteResponse : localResponse;
  return response.fold((l) => null, (r) => r);
}

Future<AppVersion?> checkAvailableVersion() async {
  AppVersionsList? response = await getVersions();
  return response?.versionsList.isEmpty ?? false ? null : response?.versionsList.last;
}

Future<void> checkForceUpdate() async {}

noInternetConnectionSnackBar() => AppSnackBar().show(message: Texts.to.connectionInternetNotAvailableText);

showLoadingDialog() => AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear());

appExitDialog() => AppAlertDialogs().withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

appRestart({AppPageDetail? bootPage}) async {
  showLoadingDialog();
  appLogPrint('App Reset Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  Get.reloadAll();
}

appReset() {}

appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  exit(0);
}
