import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/storage/app_storage_module.dart';
import '../ui_kit/dialogs/app_alert_dialogs.dart';
import '../ui_kit/dialogs/app_alert_widget_dialogs.dart';
import '../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';
import '../ui_kit/main_widgets/progress_indicator.dart';
import '../ui_kit/main_widgets/snackbar.dart';
import 'app_routing/app_routing.dart';
import 'core_models/core_models/app_data/app_data.dart';
import 'core_models/core_models/app_page_detail/app_page_detail.dart';
import 'core_resources/core_flags.dart';
import '../features/versions/data/versions_local_data_source.dart';
import '../features/versions/data/versions_remote_data_source.dart';
import '../features/versions/models/app_version/app_version.dart';
import 'app_localization_texts.dart';

void appDebugPrint(message) => isRelease ? null : debugPrint('[Debug] $message');
void appLogPrint(message) => debugPrint('[LOG] $message');

void popPage() {
  Get.back();
}

nullFunction() => null;

bool? clearAppData() {
  bool result = false;
  final response = AppStorage.to.clearStorage();
  response.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r);
  return result;
}

bool? saveAppData(AppData appData) {
  bool response = false;
  AppStorage.to.saveAppData(appData: appData).then((value) => response = value);
  return response;
}

AppData? loadAppData() {
  AppData? appData;
  AppStorage.to.loadAppData().then((value) => appData = value);
  return appData;
}

void printAllData({bool? detailsIncluded}) async {
  AppData? appData = loadAppData();
  AppStorage.to.printData(appData: appData, detailsIncluded: detailsIncluded);
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

Future<void> checkForceUpdate() async {
  AppVersion? version = await checkAvailableVersion();
  if (version != null) {
    if (version.isForceUpdate == true) {
      goToUpdatePage(popAll: true);
    }
  }
}

noInternetConnectionSnackBar() => AppSnackBar.show(message: Texts.to.connectionInternetNotAvailableText);

showLoadingDialog({bool? isDismissible}) => AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear(), dismissible: isDismissible);

appExitDialog() => AppAlertDialogs.withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

appRestart({AppPageDetail? bootPage}) async {
  showLoadingDialog();
  appLogPrint('App Reset Triggered');
  Get.reloadAll();
}

appReset() {}

appExit() {
  appLogPrint('App Exit Triggered');
  exit(0);
}
