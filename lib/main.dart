import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_extensions/extension_app_routes.dart';
import 'core/app_localization.dart';
import 'core/app_bindings/core_bindings.dart';
import 'core/app_routing/app_pages.dart';
import 'data/info/app_defaults.dart';
import 'data/info/app_info.dart';
import 'data/resources/app_enums.dart';
import 'data/resources/app_theme/app_themes.dart';

// import 'generated/l10n.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  CoreBindings().dependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      initialBinding: CoreBindings(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashScreen.route,
      unknownRoute: AppPages.unknownRoute,
      defaultTransition: Transition.fadeIn,
      transitionDuration: appDefaultTransitionDuration,
      color: AppThemes.to.primaryColor,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      supportedLocales: AppLocalization.to.supportedLocales,
      localizationsDelegates: AppLocalization.to.localizationDelegates,
      locale: AppLocalization.to.getDefaultLocale(),
      textDirection: AppLocalization.to.getTextDirection(),
      popGesture: true,
    );
  }
}
