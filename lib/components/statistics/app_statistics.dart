import 'package:get/get.dart';

import '../../core/core_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../core/extensions/extensions_on_data_models/extension_statistics.dart';

class AppStatistics {
  static AppStatistics get to => Get.find();

  AppStatisticsData data = const AppStatisticsData();

  increaseLaunch() {
    data = data.loadFromStorage().increaseLaunch();
    data.saveOnStorage();
  }

  increaseLogin() {
    data = data.loadFromStorage().increaseLogin();
    data.saveOnStorage();
  }

  increaseCrashes() {
    data = data.loadFromStorage().increaseCrashes();
    data.saveOnStorage();
  }

  increasePageOpens() {
    data = data.loadFromStorage().increasePageOpens();
    data.saveOnStorage();
  }

  increaseApiCalls() {
    data = data.loadFromStorage().increaseApiCalls();
    data.saveOnStorage();
  }
}