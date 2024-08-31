import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_notification_base_model.freezed.dart';
part 'local_notification_base_model.g.dart';

@freezed
class AppLocalNotificationBaseModel with _$AppLocalNotificationBaseModel {
  const factory AppLocalNotificationBaseModel({
    final String? title,
  }) = _AppLocalNotificationBaseModel;

  factory AppLocalNotificationBaseModel.fromJson(Map<String, dynamic> json) => _$AppLocalNotificationBaseModelFromJson(json);
}
