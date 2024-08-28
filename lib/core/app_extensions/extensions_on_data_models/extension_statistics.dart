import 'package:get/get.dart';

import '../../../app/functional_components/specific_dialogs/exceptions_dialog.dart';
import '../../../data/shared_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../failures/local_exception.dart';

extension ExtensionAppStatisticsRxStorage on Rx<AppStatisticsData> {
  void saveOnStorage() async => await AppLocalStorage.to.saveAppStatisticsData(appStatisticsData: value);
  Rx<AppStatisticsData> loadFromStorage() => value.loadFromStorage().obs;
}

extension ExtensionAppStatisticsStorage on AppStatisticsData {
  void saveOnStorage() async => await AppLocalStorage.to.saveAppStatisticsData(appStatisticsData: this);
  AppStatisticsData loadFromStorage() {
    var data = AppLocalStorage.to.loadAppStatisticsData().fold((l) => AppExceptionsDialog<LocalException>().local(exception: l), (r) => r?.calculateInstallDuration());
    return data;
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
  AppStatisticsData get increaseLaunch => copyWith(launches: launches == null ? 0 : launches! + 1);
  AppStatisticsData get increaseLogin => copyWith(logins: logins == null ? 0 : logins! + 1);
  AppStatisticsData get increaseCrashes => copyWith(crashes: crashes == null ? 0 : crashes! + 1);
  AppStatisticsData get increasePageOpens => copyWith(pageOpens: pageOpens == null ? 0 : pageOpens! + 1);
  AppStatisticsData get increaseApiCalls => copyWith(apiCalls: apiCalls == null ? 0 : apiCalls! + 1);
}

extension ExtensionAppStatisticsCalculations on AppStatisticsData {
  AppStatisticsData calculateInstallDuration() => installDateTime == null ? this : copyWith(installDuration: DateTime.now().difference(installDateTime!));
}
