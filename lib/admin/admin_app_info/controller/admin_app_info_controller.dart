import 'package:get/get.dart';

import '../../../core/app_extensions/data_models_extensions/extension_statistics.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/models/core_models/app_statistics_data/app_statistics_data.dart';

class AdminAppInfoController extends CoreController {
  Rx<AppStatisticsData> statisticsData = const AppStatisticsData().obs;

  @override
  void dataInit() {
    // clearAppData();
    statisticsData.value = statisticsData.value.loadFromStorage;
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminAppInfoPage;
  }
}
