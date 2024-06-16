extension StringProvidersNull on DateTime? {
  String get toDateTimeFormat => this == null ? '' : this!.toDateTimeFormat;
  String get toDateFormat => this == null ? '' : this!.toDateFormat;
  String get toTimeFormat => this == null ? '' : this!.toTimeFormat;
  String get toTimeFormatWithSeconds => this == null ? '' : this!.toTimeFormatWithSeconds;
}

extension StringProviders on DateTime {
  String get toDateTimeFormat =>
      '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String get toDateFormat => '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
  String get toTimeFormat => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String get toTimeFormatWithSeconds => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}

extension CompareNull on DateTime? {
  bool equalTo(DateTime? dateTime) => this == null && dateTime == null
      ? true
      : this == null || dateTime == null
          ? false
          : this!.equalTo(dateTime);
}

extension Compare on DateTime {
  bool equalTo(DateTime? dateTime) => dateTime == null ? false : toDateTimeFormat == dateTime.toDateTimeFormat;
}
