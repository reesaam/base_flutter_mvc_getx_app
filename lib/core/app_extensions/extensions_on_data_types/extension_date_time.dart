import '../../app_localization_texts.dart';

extension ExtensionDateTimeStringProvidersNull on DateTime? {
  String toDateTimeFormat() => this == null ? Texts.to.empty : this!.toDateTimeFormat();
  String toDateFormat() => this == null ? Texts.to.empty : this!.toDateFormat();
  String toTimeFormat() => this == null ? Texts.to.empty : this!.toTimeFormat();
  String toTimeFormatWithSeconds() => this == null ? Texts.to.empty : this!.toTimeFormatWithSeconds();
}

extension ExtensionDateTimeStringProviders on DateTime {
  String toDateTimeFormat() =>
      '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toDateFormat() => '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
  String toTimeFormat() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String toTimeFormatWithSeconds() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}

extension ExtensionDateTimeCompareNull on DateTime? {
  bool equalTo(DateTime? dateTime) => this == null && dateTime == null
      ? true
      : this == null || dateTime == null
          ? false
          : this!.equalTo(dateTime);
}

extension ExtensionDateTimeCompare on DateTime {
  bool equalTo(DateTime? dateTime) => dateTime == null ? false : toDateTimeFormat == dateTime.toDateTimeFormat;
}
