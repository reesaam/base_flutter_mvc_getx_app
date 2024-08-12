import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension StringProvidersNull on Jalali? {
  String get toDateTimeFormat => this == null ? Texts.to.empty : this!.toDateTimeFormat;
  String get toDateFormat => this == null ? Texts.to.empty : this!.toDateFormat;
  String get toTimeFormat => this == null ? Texts.to.empty : this!.toTimeFormat;
  String get toTimeFormatWithSeconds => this == null ? Texts.to.empty : this!.toTimeFormatWithSeconds;
}

extension StringProvider on Jalali {
  String get toDateTimeFormat =>
      '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')} - ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String get toDateFormat => '${year.toString().padLeft(4, '0')}/${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}';
  String get toTimeFormat => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  String get toTimeFormatWithSeconds => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
}
