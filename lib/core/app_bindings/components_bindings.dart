import 'package:get/get.dart';

import '../../app/functional_components/connectivity/connectivity.dart';
import '../../app/functional_components/permissions/permissions.dart';
import '../../data/statistics/app_statistics.dart';
import '../app_localization.dart';
import '../network/dio.dart';


class AppComponentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLocalization>(() => AppLocalization(), fenix: true);
    Get.lazyPut<ConnectionChecker>(() => ConnectionChecker(), fenix: true);
    Get.lazyPut<AppPermissions>(() => AppPermissions(), fenix: true);
    Get.lazyPut<AppStatistics>(() => AppStatistics(), fenix: true);
    Get.lazyPut<DioCore>(() => DioCore(), fenix: true);
  }
}