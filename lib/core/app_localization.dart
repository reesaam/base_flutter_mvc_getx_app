import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart';

import '../core/app_extensions/extensions_on_data_types/extension_app_languages.dart';
import '../core/app_extensions/extensions_on_data_models/extension_settings.dart';
import '../features/settings/models/app_settings_data/app_setting_data.dart';
import '../generated/l10n.dart';

class AppLocalization {
  static AppLocalization get to => Get.find();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languages => [english, deutsch, persian];
  static Locale get english => const Locale('en', '1');
  static Locale get deutsch => const Locale('de', '44');
  static Locale get persian => const Locale('fa', '98');

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Variables
  Locale defaultLanguage = english;

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

  String get _getTimeZoneAbbreviation => 'TEST';

  bool get _getDST => false;
}

class Texts {
  Texts._();
  static S get to => S.of(Get.context!);
}
