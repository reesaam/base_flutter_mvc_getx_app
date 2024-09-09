import 'package:get/get.dart';

import '../../app/functional_components/connectivity/app_connectivity.dart';
import '../../app/functional_components/file_functions/app_file_functions.dart';
import '../../app/functional_components/permissions/app_permissions.dart';
import '../../data/resources/app_theme/app_themes.dart';
import '../../data/statistics/app_statistics.dart';
import '../app_localization.dart';
import '../network/dio.dart';

class AppComponentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppThemes>(() => AppThemes(), fenix: true);
    Get.lazyPut<AppLocalization>(() => AppLocalization(), fenix: true);
    Get.lazyPut<AppConnectionChecker>(() => AppConnectionChecker(), fenix: true);
    Get.lazyPut<AppPermissions>(() => AppPermissions(), fenix: true);
    Get.lazyPut<AppFileFunctions>(() => AppFileFunctions(), fenix: true);
    Get.lazyPut<AppStatistics>(() => AppStatistics(), fenix: true);
    Get.lazyPut<DioCore>(() => DioCore(), fenix: true);
  }
}
