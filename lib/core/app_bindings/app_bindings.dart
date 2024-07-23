import 'package:get/get.dart';

import '../../features/about/controller/about_controller.dart';
import '../../features/homepage/controller/homepage_controller.dart';
import '../../features/not_found/controller/not_found_controller.dart';
import '../../features/settings/controller/settings_controller.dart';
import '../../features/splash_screen/controller/splash_screen_controller.dart';
import '../../features/update/controller/update_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(), fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
    Get.lazyPut<NotFoundController>(() => NotFoundController(), fenix: true);
  }
}