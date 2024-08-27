import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart';

import '../core/app_extensions/extensions_on_data_types/extension_app_languages.dart';
import '../core/app_extensions/extensions_on_data_models/extension_settings.dart';
import '../data/resources/app_countries.dart';
import '../data/resources/app_enums.dart';
import '../features/settings/models/app_settings_data/app_setting_data.dart';
import '../generated/l10n.dart';

class AppLocalization {
  static AppLocalization get to => Get.find();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languages => [english, deutsch, persian];
  static Locale get english => Locale(AppLanguages.english.locale.languageCode, AppCountries.us.code);
  static Locale get deutsch => Locale(AppLanguages.deutsch.locale.languageCode, AppCountries.germany.code);
  static Locale get persian => Locale(AppLanguages.persian.locale.languageCode, AppCountries.iran.code);

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Variables
  Locale defaultLanguage = english;
  AppCountries defaultCountry = AppCountries.us;
  TextDirection defaultTextDirection = TextDirection.ltr;

  Locale getDefaultLocale() {
    var appSettings = const AppSettingData().loadFromStorage;
    return appSettings.language.getLocale;
  }

  TextDirection getTextDirection() {
    var appSettings = const AppSettingData().loadFromStorage;
    return appSettings.language.getLocale == persian ? TextDirection.rtl : defaultTextDirection;
  }

  TimeZone getTimeZone() => TimeZone(
        DateTime.now().timeZoneOffset.inMilliseconds,
        abbreviation: _getTimeZoneAbbreviation,
        isDst: _getDST,
      );

  AppCountries getCountry() {
    var appSettings = const AppSettingData().loadFromStorage;
    return appSettings.country;
  }

  String get _getTimeZoneAbbreviation => getCountry().timeZoneAbbreviation?.first ?? defaultCountry.timeZoneAbbreviation?.first ?? '';

  bool get _getDST => _getTimeZoneAbbreviation.isEmpty ? false : _getTimeZoneAbbreviation.contains('DT');
}
