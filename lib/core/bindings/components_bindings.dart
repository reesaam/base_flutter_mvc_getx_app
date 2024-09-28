import 'package:get/get.dart';

import '../../components/connectivity/connectivity.dart';
import '../../components/file_functions/file_functions.dart';
import '../../components/network/dio.dart';
import '../../components/permissions/permissions.dart';
import '../../components/statistics/statistics.dart';
import '../../ui_kit/theme/themes.dart';
import '../app_localization.dart';

class AppComponentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioCore>(() => DioCore(), fenix: true);
    Get.lazyPut<AppThemes>(() => AppThemes(), fenix: true);
    Get.lazyPut<AppLocalization>(() => AppLocalization(), fenix: true);
    Get.lazyPut<AppConnectionChecker>(() => AppConnectionChecker(), fenix: true);
    Get.lazyPut<AppPermissions>(() => AppPermissions(), fenix: true);
    Get.lazyPut<AppFileFunctions>(() => AppFileFunctions(), fenix: true);
    Get.lazyPut<AppStatistics>(() => AppStatistics(), fenix: true);
  }
}
