import 'package:timezone/timezone.dart';

import '../../../data/shared_models/helper_models/duration_custom_model/duration_custom_model.dart';
import '../../app_localization.dart';
import 'extension_duration.dart';

extension ExtensionTimeZone on TimeZone {
  DurationCustomModel get toDifferentCustomModel => Duration(milliseconds: offset).calculateDifferenceInCustomDateTimeModel;

  String get countryName => Texts.to.notAvailableInitials;

  String get toFormattedOffset {
    var offset = toDifferentCustomModel;
    var sign = offset.toString()[0] == '-' ? '-' : '+';
    return '$sign${offset.hour.toString().padLeft(2, '0')}:${offset.minute.toString().padLeft(2, '0')}';
  }
}
