import 'package:get/get.dart';

import '../../components/connectivity/app_connectivity.dart';
import '../../components/file_functions/app_file_functions.dart';
import '../../components/network/dio.dart';
import '../../components/permissions/app_permissions.dart';
import '../../components/statistics/app_statistics.dart';
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
