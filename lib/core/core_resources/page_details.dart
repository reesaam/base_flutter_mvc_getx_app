import '../app_localization_texts.dart';
import '../core_models/core_models/app_page_detail/app_page_detail.dart';
import 'core_enums.dart';
import 'icons.dart';

class AppPageDetails {
  static List<AppPageDetail> get listPages => [
        splashScreen,
        homepage,
        settings,
        about,
        update,
        notFound,
      ];

  static List<AppPageDetail> get listAdminPages => [
        adminStartPage,
        adminTestPage,
        adminAppInfoPage,
        adminAppResourcesPage,
        adminWidgetCheckPage,
        adminDataFormatCheckPage,
        adminVerifiersPage,
        adminAppCountriesPage,
        appDocs,
      ];

  ///Admin Pages
  static AppPageDetail adminStartPage = AppPageDetail(
    pageName: Texts.to.adminStartPagePageName,
    pageRoute: AppRoutes.adminStartPage,
  );

  static AppPageDetail adminTestPage = AppPageDetail(
    pageName: Texts.to.adminTestPageName,
    pageRoute: AppRoutes.adminTestPage,
  );

  static AppPageDetail adminAppInfoPage = AppPageDetail(
    pageName: Texts.to.adminAppInfoPageName,
    pageRoute: AppRoutes.adminAppInfoPage,
  );

  static AppPageDetail adminAppResourcesPage = AppPageDetail(
    pageName: Texts.to.adminAppResourcesPageName,
    pageRoute: AppRoutes.adminAppResourcesPage,
  );

  static AppPageDetail adminWidgetCheckPage = AppPageDetail(
    pageName: Texts.to.adminWidgetCheckPageName,
    pageRoute: AppRoutes.adminWidgetCheckPage,
  );

  static AppPageDetail adminDataFormatCheckPage = AppPageDetail(
    pageName: Texts.to.adminDataFormatCheckPageName,
    pageRoute: AppRoutes.adminDataFormatCheckPage,
  );

  static AppPageDetail adminVerifiersPage = AppPageDetail(
    pageName: Texts.to.adminVerifiersPageName,
    pageRoute: AppRoutes.adminVerifiersPage,
  );

  static AppPageDetail adminAppCountriesPage = AppPageDetail(
    pageName: Texts.to.adminAppCountriesPageName,
    pageRoute: AppRoutes.adminAppCountriesPage,
  );

  static AppPageDetail appDocs = AppPageDetail(
    pageName: Texts.to.appDocsPageName,
    pageRoute: AppRoutes.appDocs,
  );

  ///Main Pages
  static AppPageDetail splashScreen = AppPageDetail(
    pageName: Texts.to.splashScreenPageName,
    pageRoute: AppRoutes.splashScreen,
  );

  static AppPageDetail homepage = AppPageDetail(
    pageName: Texts.to.homePageName,
    pageRoute: AppRoutes.homepage,
    iconCode: AppIcons.home.icon!.codePoint,
    bottomBarItemNumber: 0,
    drawerPresence: true,
  );

  static AppPageDetail settings = AppPageDetail(
    pageName: Texts.to.settingsPageName,
    pageRoute: AppRoutes.settings,
    iconCode: AppIcons.settings.icon!.codePoint,
    bottomBarItemNumber: 1,
    drawerPresence: true,
  );

  static AppPageDetail about = AppPageDetail(
    pageName: Texts.to.aboutPageName,
    pageRoute: AppRoutes.about,
    iconCode: AppIcons.about.icon!.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail update = AppPageDetail(
    pageName: Texts.to.updatePageName,
    pageRoute: AppRoutes.update,
    iconCode: AppIcons.update.icon!.codePoint,
    drawerPresence: true,
  );

  static AppPageDetail notFound = AppPageDetail(
    pageName: Texts.to.notFoundPageName,
    pageRoute: AppRoutes.notFound,
  );
}
