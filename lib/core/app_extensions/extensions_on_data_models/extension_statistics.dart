import 'package:get/get.dart';

import '../../../app/functional_components/specific_dialogs/exceptions_dialog.dart';
import '../../../data/models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../../data/models/core_models/app_statistics_detailed_data/app_statistics_detailed_data.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../failures/local_exception.dart';

extension RxStorage on Rx<AppStatisticsData> {
  void get saveOnStorage async => await AppLocalStorage.to.saveAppStatisticsData(appStatisticsData: value);
  Rx<AppStatisticsData> get loadFromStorage => value.loadFromStorage.obs;
}

extension Storage on AppStatisticsData {
  void get saveOnStorage async => await AppLocalStorage.to.saveAppStatisticsData(appStatisticsData: this);
  AppStatisticsData get loadFromStorage {
    var data = AppLocalStorage.to.loadAppStatisticsData().fold((l) => AppExceptionsDialog<LocalException>().local(exception: l), (r) => r?.calculateInstallDuration);
    return data;
  }
}

extension RxClear on Rx<AppStatisticsData> {
  Rx<AppStatisticsData> get clearData => value.clearData.obs;
}

extension Clear on AppStatisticsData {
  AppStatisticsData get clearData => const AppStatisticsData();
}

extension Increases on AppStatisticsData {
  //Data
  AppStatisticsData get increaseLaunch => copyWith(launches: launches! + 1);
  AppStatisticsData get increaseLogin => copyWith(logins: logins! + 1);
  AppStatisticsData get increaseCrashes => copyWith(crashes: crashes! + 1);

  //Details
  get increasePageOpens => copyWith(detailedData: detailedData?._increasePageOpens);
  get increaseApiCalls => copyWith(detailedData: detailedData?._increaseApiCalls);
}

extension Calculations on AppStatisticsData {
  AppStatisticsData get calculateInstallDuration => installDateTime == null ? this : copyWith(installDuration: DateTime.now().difference(installDateTime!));
}

/// On Details
extension DetailsIncreases on AppStatisticsDetailedData {
  get _increasePageOpens => copyWith(pageOpens: pageOpens! + 1);
  get _increaseApiCalls => copyWith(apiCalls: apiCalls! + 1);
}
