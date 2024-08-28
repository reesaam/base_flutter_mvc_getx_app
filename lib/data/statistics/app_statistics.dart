import 'package:get/get.dart';

import '../../core/app_extensions/extensions_on_data_models/extension_statistics.dart';
import '../shared_models/core_models/app_statistics_data/app_statistics_data.dart';

class AppStatistics {
  static AppStatistics get to => Get.find();

  AppStatisticsData data = const AppStatisticsData();

  increaseLaunch() {
    data = data.loadFromStorage().increaseLaunch;
    data.saveOnStorage();
  }

  increaseLogin() {
    data = data.loadFromStorage().increaseLogin;
    data.saveOnStorage();
  }

  increaseCrashes() {
    data = data.loadFromStorage().increaseCrashes;
    data.saveOnStorage();
  }

  increasePageOpens() {
    data = data.loadFromStorage().increasePageOpens;
    data.saveOnStorage();
  }

  increaseApiCalls() {
    data = data.loadFromStorage().increaseApiCalls;
    data.saveOnStorage();
  }
}
