import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'components/notifications/local_notifications/local_notifications.dart';
import 'core/app_localization.dart';
import 'core/app_routing/app_pages.dart';
import 'core/bindings/core_bindings.dart';
import 'core/core_functions.dart';
import 'core/core_info/app_info.dart';
import 'core/core_resources/core_enums.dart';
import 'core/core_resources/defaults.dart';
import 'core/extensions/extension_app_routes.dart';
import 'core/extensions/extension_for_prints/extension_for_prints.dart';
import 'ui_kit/theme/themes.dart';

// import 'generated/l10n.dart';

void main() => initProject();

void initProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init().withStatusPrint(isLog: true, featureName: 'Get Storage Initialization');
  await AppLocalNotifications().init().withStatusPrint(isLog: true, featureName: 'App Local Notifications Initialization');
  CoreBindings().dependencies();
  appInitializationFunction();
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
      locale: AppLocalization.to.getLocale(),
      textDirection: AppLocalization.to.getTextDirection(),
      popGesture: true,
    );
  }
}
