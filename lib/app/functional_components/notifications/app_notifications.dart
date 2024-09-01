import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'app_notifications_repository.dart';
import 'notifications_enums.dart';

class AppNotifications {
  static showSimpleLocalNotification({
      String? title,
      String? bigPicture,
      String? body,
      String? icon,
      String? largeIcon,
      int? timeoutAfterLongSeconds,
      bool? wakeUpScreen,
}) {
    AppNotificationsRepository.createNotification(
        channelKey: AppNotificationChannelKey.simple,
        title: title,
        bigPicture: bigPicture,
        body: body,
        icon: icon,
        largeIcon: largeIcon,
        timeoutAfterLongSeconds: timeoutAfterLongSeconds,
        wakeUpScreen: wakeUpScreen,
    );
  }

  static showSimplePushNotification() {}
}
