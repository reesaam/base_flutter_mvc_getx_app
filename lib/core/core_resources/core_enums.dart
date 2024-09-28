import 'package:flutter/material.dart';

import '../../components/storage/storage_providers/app_local_storage.dart';
import '../../components/storage/storage_providers/app_shared_preferences.dart';

enum AppDataVersions {
  v1(1);

  final int number;
  const AppDataVersions(this.number);
}

enum AppStorageProvider {
  getStorage,
  sharedPreferences,
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
  ///App Pages
  splashScreen,
  homepage,
  settings,
  update,
  about,

  ///General Pages
  notFound,

  ///Admin Pages
  adminStartPage,
  adminTestPage,
  adminAppInfoPage,
  adminAppResourcesPage,
  adminWidgetCheckPage,
  adminDataFormatCheckPage,
  adminAppCountriesPage,
  appDocs,
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
