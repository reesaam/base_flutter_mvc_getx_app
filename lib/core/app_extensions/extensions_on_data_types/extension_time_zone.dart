import 'package:timezone/timezone.dart';

import '../../../data/resources/app_countries.dart';
import '../../../data/shared_models/helper_models/duration_custom_model/duration_custom_model.dart';
import '../../app_localization_texts.dart';
import 'extension_custom_duration.dart';
import 'extension_duration.dart';

extension ExtensionTimeZone on TimeZone {
  String get countryName {
    String result = Texts.to.notAvailableInitials;
    for (var country in AppCountry.values) {
      for (var abbr in country.timeZoneAbbreviation!) {
        if (abbr == abbreviation) {
          result = country.countryName ?? Texts.to.notAvailableInitials;
        }
      }
    }
    return result;
  }

  DurationCustomModel toDurationCustomModel() => Duration(milliseconds: offset).calculateDifference();

  String toFormattedOffset() => toDurationCustomModel().toDuration().toTimeZoneFormat();
}
