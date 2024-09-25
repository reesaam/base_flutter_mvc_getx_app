import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../components/failures/local_exception.dart';
import '../../../components/storage/app_storage.dart';
import '../../../ui_kit/dialogs/specific_dialogs/exceptions_dialog.dart';
import '../../core_models/core_models/app_statistics_data/app_statistics_data.dart';


extension ExtensionAppStatisticsRxStorage on Rx<AppStatisticsData> {
  void saveOnStorage() async => await AppStorage.to.saveAppStatisticsData(appStatisticsData: value);
  Rx<AppStatisticsData> loadFromStorage() => value.loadFromStorage().obs;
}

extension ExtensionAppStatisticsStorage on AppStatisticsData {
  void saveOnStorage() async => await AppStorage.to.saveAppStatisticsData(appStatisticsData: this);
  AppStatisticsData loadFromStorage() {
    Either<LocalException, AppStatisticsData?>? data;
    AppStorage.to.loadAppStatisticsData().then((value) => data = value);
    AppStatisticsData? result;
    data?.fold((l) => AppExceptionsDialog.local(exception: l), (r) => result = r?.calculateInstallDuration());
    return result ?? const AppStatisticsData();
  }
}

extension ExtensionAppStatisticsRxClear on Rx<AppStatisticsData> {
  Rx<AppStatisticsData> clearData() => value.clearData().obs;
}

extension ExtensionAppStatisticsClear on AppStatisticsData {
  AppStatisticsData clearData() => const AppStatisticsData();
}

extension ExtensionAppStatisticsIncreases on AppStatisticsData {
  //Data
  AppStatisticsData increaseLaunch() {
    final result = copyWith(launches: launches == null ? 0 : launches! + 1);
    AppStorage.to.saveAppStatisticsData(appStatisticsData: result);
    return result;
  }

  AppStatisticsData increaseLogin() {
    final result = copyWith(logins: logins == null ? 0 : logins! + 1);
    AppStorage.to.saveAppStatisticsData(appStatisticsData: result);
    return result;
  }

  AppStatisticsData increaseCrashes() {
    final result = copyWith(crashes: crashes == null ? 0 : crashes! + 1);
    AppStorage.to.saveAppStatisticsData(appStatisticsData: result);
    return result;
  }

  AppStatisticsData increasePageOpens() {
    final result = copyWith(pageOpens: pageOpens == null ? 0 : pageOpens! + 1);
    AppStorage.to.saveAppStatisticsData(appStatisticsData: result);
    return result;
  }

  AppStatisticsData increaseApiCalls() {
    final result = copyWith(apiCalls: apiCalls == null ? 0 : apiCalls! + 1);
    AppStorage.to.saveAppStatisticsData(appStatisticsData: result);
    return result;
  }
}

extension ExtensionAppStatisticsCalculations on AppStatisticsData {
  AppStatisticsData calculateInstallDuration() =>
      installDateTime == null ? this : copyWith(installDuration: DateTime.now().difference(installDateTime!));
}
