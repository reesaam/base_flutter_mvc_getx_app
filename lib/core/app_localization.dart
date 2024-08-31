import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart';

import '../core/app_extensions/extensions_on_data_types/extension_app_languages.dart';
import '../core/app_extensions/extensions_on_data_models/extension_settings.dart';
import '../data/resources/app_countries.dart';
import '../data/resources/app_enums.dart';
import '../data/shared_models/helper_models/duration_custom_model/duration_custom_model.dart';
import '../features/settings/models/app_settings_data/app_setting_data.dart';
import '../generated/l10n.dart';
import 'app_extensions/extensions_on_data_types/extension_custom_duration.dart';
import 'app_extensions/extensions_on_data_types/extension_on_list.dart';
import 'app_extensions/extensions_on_data_types/extension_time_zone.dart';
import 'core_functions.dart';

class AppLocalization {
  static AppLocalization get to => Get.find();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languagesList => [english, deutsch, persian];
  static Locale get english => Locale(AppLanguages.english.locale.languageCode, AppCountry.us.code);
  static Locale get deutsch => Locale(AppLanguages.deutsch.locale.languageCode, AppCountry.germany.code);
  static Locale get persian => Locale(AppLanguages.persian.locale.languageCode, AppCountry.iran.code);

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Default Variables
  Locale language = english;
  String timeZoneAbbreviation = AppCountry.us.timeZoneAbbreviation?.getMiddleElement() ?? '';
  bool isDst = false;

  Locale getLocale() {
    var appSettings = const AppSettingData().loadFromStorage();
    language = appSettings.language.getLocale();
    return language;
  }

  TextDirection getTextDirection() {
    var appSettings = const AppSettingData().loadFromStorage();
    TextDirection textDirection = appSettings.language.getLocale() == persian ? TextDirection.rtl : TextDirection.ltr;
    return textDirection;
  }

  TimeZone getTimeZone() {
    DateTime currentTime = DateTime.now();
    TimeZone timeZone = TimeZone(
      currentTime.timeZoneOffset.inMilliseconds,
      abbreviation: currentTime.timeZoneName,
      isDst: currentTime.timeZoneName.contains('DT'),
    );
    return timeZone;
  }

  AppCountry getCountry() {
    var timeZone = getTimeZone().toDurationCustomModel();
    for (var c in AppCountry.values) {
      for (var tz in c.timeZoneOffset!) {
        if (tz == timeZone) return c;
      }
    }
    return AppCountry.us;
  }
}
