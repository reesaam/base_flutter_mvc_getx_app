import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_base_model.freezed.dart';
part 'push_notification_base_model.g.dart';

@freezed
class AppPushNotificationBaseModel with _$AppPushNotificationBaseModel {
  const factory AppPushNotificationBaseModel({
    final String? title,
  }) = _AppPushNotificationBaseModel;

  factory AppPushNotificationBaseModel.fromJson(Map<String, dynamic> json) => _$AppPushNotificationBaseModelFromJson(json);
}
