import '../../../data/shared_models/helper_models/duration_custom_model/duration_custom_model.dart';

extension ExtensionCustomDuration on DurationCustomModel {
  Duration toDuration() => Duration(days: day ?? 0, hours: hour ?? 0, minutes: minute ?? 0, seconds: second ?? 0, milliseconds: milliSecond ?? 0);
}
