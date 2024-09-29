import 'package:get/get.dart';

import '../../../core/core_elements/core_controller.dart';
import '../../../core/core_models/core_models/app_statistics_data/app_statistics_data.dart';
import '../../../core/core_resources/page_details.dart';
import '../../../core/extensions/extensions_on_data_models/extension_statistics.dart';

class AppDocsController extends CoreController {
  Rx<AppStatisticsData> statisticsData = const AppStatisticsData().obs;

  @override
  void dataInit() {
    // clearAppData();
    statisticsData.value = statisticsData.value.loadFromStorage();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.appDocs;
  }
}
