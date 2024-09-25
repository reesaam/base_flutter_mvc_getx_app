import 'package:get/get.dart';

import '../../components/statistics/app_statistics.dart';
import '../core_resources/core_enums.dart';
import '../core_resources/defaults.dart';
import '../extensions/extension_app_routes.dart';

///Admin Pages
gotoAdminStartPage() => goToPage(AppRoutes.adminStartPage);
gotoAdminTestPage() => goToPage(AppRoutes.adminTestPage);
gotoAdminAppInfoPage() => goToPage(AppRoutes.adminAppInfoPage);
gotoAdminAppResourcesPage() => goToPage(AppRoutes.adminAppResourcesPage);
gotoAdminWidgetCheckPage() => goToPage(AppRoutes.adminWidgetCheckPage);
gotoAdminDataFormatCheckPage() => goToPage(AppRoutes.adminDataFormatCheckPage);
gotoAdminAppCountriesPage() => goToPage(AppRoutes.adminAppCountriesPage);

///App Pages
goToSplashScreenPage({bool? popAll}) => goToPage(AppRoutes.splashScreen);
goToHomePage({bool? popAll}) => goToPage(AppRoutes.homepage);
goToSettingsPage({bool? popAll}) => goToPage(AppRoutes.settings);
goToUpdatePage({bool? popAll}) => goToPage(AppRoutes.update);
goToAboutPage({bool? popAll}) => goToPage(AppRoutes.about);

goToPage(AppRoutes route, {bool? popAll}) {
  AppStatistics.to.increasePageOpens();
  if (popAll == true) {
    AppRoutes.values.contains(route) ? Get.offAllNamed(route.route) : Get.toNamed(AppRoutes.notFound.route);
  } else {
    AppRoutes.values.contains(route) ? Get.toNamed(route.route) : Get.toNamed(AppRoutes.notFound.route);
  }
}

goToPageWithDelay(AppRoutes route, {bool? popAll, int? delayInSeconds}) async {
  await Future.delayed(Duration(seconds: delayInSeconds ?? appDefaultPageTransitionDelay));
  goToPage(route);
}
