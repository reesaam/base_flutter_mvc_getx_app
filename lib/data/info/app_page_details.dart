import '../../core/app_localization.dart';
import '../models/app_page_detail/app_page_detail.dart';
import '../resources/app_enums.dart';
import '../resources/app_icons.dart';

class AppPageDetails {
  List<AppPageDetail> get listPages => [
    splashScreen,
    homepage,
    settings,
    about,
    update,
    notFound,
  ];

  List<AppPageDetail> get listAdminPages => [
    adminStartPage,
    adminPagesTestPage,
    adminUITestPage,
  ];

  ///Admin Pages
  AppPageDetail adminStartPage = AppPageDetail(
    pageName: Texts.to.adminStartPagePageName,
    pageRoute: AppRoutes.adminStartPage,
  );

  AppPageDetail adminPagesTestPage = AppPageDetail(
    pageName: Texts.to.adminTestPagePageName,
    pageRoute: AppRoutes.adminTestPage,
  );

  AppPageDetail adminUITestPage = AppPageDetail(
    pageName: Texts.to.adminUITestPagePageName,
    pageRoute: AppRoutes.adminUITestPagePage,
  );

  ///Main Pages
  AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.splashScreenPageName,
    pageRoute: AppRoutes.splashScreen,
  );

  AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: AppRoutes.homepage,
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.settingsPageName,
    pageRoute: AppRoutes.settings,
    iconCode: AppIcons.settings.icon!.codePoint,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  AppPageDetail about = AppPageDetail(
    pageName: Texts.to.aboutPageName,
    pageRoute: AppRoutes.about,
    iconCode: AppIcons.about.icon!.codePoint,
    drawerPresence: true,
  );

  AppPageDetail update = AppPageDetail(
    pageName: Texts.to.updatePageName,
    pageRoute: AppRoutes.update,
    iconCode: AppIcons.update.icon!.codePoint,
    drawerPresence: true,
  );

  AppPageDetail notFound = AppPageDetail(
    pageName: Texts.to.notFoundPageName,
    pageRoute: AppRoutes.notFound,
  );
}
