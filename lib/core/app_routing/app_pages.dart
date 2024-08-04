import 'package:get/get.dart';

import '../../../../core/app_extensions/extension_app_routes.dart';
import '../../admin/admin_app_info/view/admin_app_info_page.dart';
import '../../admin/admin_app_resources/view/admin_app_resources_page.dart';
import '../../admin/admin_start/view/admin_start_page.dart';
import '../../admin/admin_test/view/admin_test_page.dart';
import '../../admin/admin_widget_check/view/admin_widget_check_page.dart';
import '../../data/resources/app_enums.dart';
import '../../features/about/view/about_view.dart';
import '../../features/homepage/view/homepage_view.dart';
import '../../features/not_found/view/not_found_view.dart';
import '../../features/settings/view/settings_view.dart';
import '../../features/splash_screen/view/splash_screen_view.dart';
import '../../features/update/view/update_view.dart';

class AppPages {
  static List<GetPage> get pages => [
    ///Admin Pages
    GetPage(name: AppRoutes.adminStartPage.route, page: AdminStartPage.new),
    GetPage(name: AppRoutes.adminTestPage.route, page: AdminTestPage.new),
    GetPage(name: AppRoutes.adminAppInfoPage.route, page: AdminAppInfoPage.new),
    GetPage(name: AppRoutes.adminAppResourcesPage.route, page: AdminAppResourcesPage.new),
    GetPage(name: AppRoutes.adminWidgetCheckPage.route, page: AdminWidgetCheckPage.new),

    ///Main App Pages
    GetPage(name: AppRoutes.splashScreen.route, page: SplashScreenPage.new),
    GetPage(name: AppRoutes.homepage.route, page: HomePage.new),
    GetPage(name: AppRoutes.settings.route, page: SettingsPage.new),
    GetPage(name: AppRoutes.update.route, page: UpdatePage.new),
    GetPage(name: AppRoutes.about.route, page: AboutPage.new),

    ///NotFound Page is ALWAYS LAST
    GetPage(name: AppRoutes.notFound.route, page: NotFoundPage.new),
  ];

  static GetPage get unknownRoute => pages.last;
}