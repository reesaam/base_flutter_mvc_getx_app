import 'package:get/get.dart';

import '../../../../core/app_extensions/extension_app_routes.dart';
import '../../data/resources/app_enums.dart';
import '../../data/statistics/app_statistics.dart';
import '../core_functions.dart';
import 'app_pages.dart';

///Admin Pages
gotoAdminStartPage() => goToPage(AppRoutes.adminStartPage);
gotoAdminTestPage() => goToPage(AppRoutes.adminTestPage);
gotoAdminAppInfoPage() => goToPage(AppRoutes.adminAppInfoPage);
gotoAdminAppResourcesPage() => goToPage(AppRoutes.adminAppResourcesPage);
gotoAdminWidgetCheckPage() => goToPage(AppRoutes.adminWidgetCheckPage);
gotoAdminDataFormatCheckPage() => goToPage(AppRoutes.adminDataFormatCheckPage);
gotoAdminAppCountriesPage() => goToPage(AppRoutes.adminAppCountriesPage);

///App Pages
goToSplashScreenPage() => goToPage(AppRoutes.splashScreen);
goToHomePage() => goToPage(AppRoutes.homepage);
goToSettingsPage() => goToPage(AppRoutes.settings);
goToUpdatePage() => goToPage(AppRoutes.update);
goToAboutPage() => goToPage(AppRoutes.about);

goToPage(AppRoutes route) {
  AppStatistics.to.increasePageOpens();
  AppRoutes.values.contains(route) ? Get.toNamed(route.route) : Get.toNamed(AppRoutes.notFound.route);
}