import 'package:flutter/material.dart';

enum AppDataVersions {
  v1(1);

  final int number;
  const AppDataVersions(this.number);
}

enum AppVersionTypes {
  release,
  beta,
  hidden,
}

enum APIVersions {
  v1;

  String get getValue => name;
}

enum APISections {
  versions,
  update;

  String get getName => name;
}

enum AppRoutes {
  splashScreen,
  homepage,
  settings,
  update,
  about,
  ///General
  notFound,
  ///Admin
  adminStartPage,
  adminTestPage,
  adminAppInfoPage,
  adminAppResourcesPage,
  adminWidgetCheckPage,
}

enum AppBottomNavigationPages {
  homepage(AppRoutes.homepage),
  update(AppRoutes.update),
  settings(AppRoutes.settings),
  about(AppRoutes.about);

  final AppRoutes appRoute;
  const AppBottomNavigationPages(this.appRoute);
}

enum AppLanguages {
  english('English', Locale('en')),
  deutsch('Deutsch', Locale('de')),
  persian('Persian', Locale('fa'));

  final String languageName;
  final Locale locale;
  const AppLanguages(this.languageName, this.locale);
}

enum AppStorageKeys {
  keyAppStatisticsData,
  keyAppData,
  keyAppDataVersion,
  keyAppVersions,
  keySettings,
}