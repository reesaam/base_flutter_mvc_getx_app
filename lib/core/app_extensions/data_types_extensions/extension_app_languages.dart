import 'package:flutter/material.dart';

import '../../../data/resources/app_enums.dart';
import '../../app_localization.dart';

extension LocaleFunctions on AppLanguages? {
  Locale get getLocale {
    var language = AppLocalization.english;
    switch (this) {
      case AppLanguages.english:
        language = AppLocalization.english;
        break;
      case AppLanguages.deutsch:
        language = AppLocalization.deutsch;
        break;
      case AppLanguages.persian:
        language = AppLocalization.persian;
        break;
      default:
        break;
    }
    return language;
  }
}
