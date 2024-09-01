import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../../../core/core_functions.dart';
import '../../../data/info/app_core_flags.dart';
import '../../../data/resources/app_theme/app_themes.dart';
import 'notification_controller.dart';
import 'notifications_enums.dart';

class AppNotificationsRepository {
  static const String _defaultIcon = '';

  static List<NotificationChannel> channels() {
    List<NotificationChannel> channels = [
      NotificationChannel(channelKey: AppNotificationChannelKey.simple.name, channelName: 'channelName', channelDescription: 'channelDescription')
    ];
    return channels;
  }

  static List<NotificationChannelGroup>? groups() {
    List<NotificationChannelGroup> groups = [
      NotificationChannelGroup(channelGroupKey: 'channelGroupKey', channelGroupName: 'channelGroupName'),
    ];
    return groups;
  }

  static Future<bool> init() async {
    var initResponse = await AwesomeNotifications().initialize(_defaultIcon, channels(), channelGroups: groups(), debug: !isRelease);
    await permissionCheck();
    _setListeners();
    return initResponse;
  }

  static _setListeners() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (receivedAction) => NotificationController.onActionReceivedMethod(receivedAction),
      onDismissActionReceivedMethod: (receivedAction) => NotificationController.onDismissActionReceivedMethod(receivedAction),
      onNotificationCreatedMethod: (receivedNotification) => NotificationController.onNotificationCreatedMethod(receivedNotification),
      onNotificationDisplayedMethod: (receivedNotification) => NotificationController.onNotificationDisplayedMethod(receivedNotification),
    );
  }

  static permissionCheck() async {
    var permissionResult = await AwesomeNotifications().isNotificationAllowed();
    if (permissionResult) {
      appDebugPrint('Permission for Notifications is Granted');
    } else {
      appDebugPrint('Requesting Notification Permission...');
      var requestResult = await AwesomeNotifications().requestPermissionToSendNotifications();
      if (requestResult) {
        appDebugPrint('Permission for Notifications is Granted');
      } else {
        appDebugPrint('Permission for Notifications is Denied');
      }
    }
  }

  static Future<bool> createNotification({
    int? id,
    required AppNotificationChannelKey channelKey,
    //Main
    List<NotificationActionButton>? actionButtons,
    Map<String, NotificationLocalization>? localizations,
    // NotificationSchedule? schedule,
    NotificationInterval? interval,
    NotificationCalendar? calendar,
    //Content
    NotificationLayout? layout,
    Color? color,
    Color? backgroundColor,
    String? title,
    ActionType? actionType,
    bool? autoDismissible,
    int? badge,
    String? bigPicture,
    String? body,
    NotificationCategory? category,
    int? chronometerLongSeconds,
    bool? criticalAlert,
    String? customSound,
    bool? displayOnBackground,
    bool? displayOnForeground,
    bool? fullScreenIntent,
    String? groupKey,
    bool? hideLargeIconOnExpand,
    String? icon,
    String? largeIcon,
    bool? locked,
    Map<String, String?>? payload,
    int? progress,
    bool? roundedBigPicture,
    bool? roundedLargeIcon,
    bool? showWhen,
    String? summary,
    String? ticker,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async =>
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: id ?? 1,
          channelKey: channelKey.name,
          notificationLayout: layout ?? NotificationLayout.Default,
          color: color,
          backgroundColor: backgroundColor,
          title: title,
          actionType: actionType ?? ActionType.Default,
          autoDismissible: autoDismissible ?? true,
          badge: badge ?? 0,
          bigPicture: bigPicture,
          body: body,
          category: category ?? NotificationCategory.Status,
          chronometer: Duration(seconds: chronometerLongSeconds ?? 0),
          criticalAlert: criticalAlert ?? false,
          customSound: customSound,
          displayOnBackground: displayOnBackground ?? true,
          displayOnForeground: displayOnForeground ?? true,
          fullScreenIntent: fullScreenIntent ?? false,
          groupKey: groupKey,
          hideLargeIconOnExpand: hideLargeIconOnExpand ?? true,
          icon: icon,
          largeIcon: largeIcon,
          locked: locked ?? false,
          payload: payload,
          progress: progress,
          roundedBigPicture: roundedBigPicture ?? false,
          roundedLargeIcon: roundedLargeIcon ?? false,
          showWhen: showWhen ?? false,
          summary: summary,
          ticker: ticker,
          timeoutAfter: Duration(seconds: timeoutAfterLongSeconds ?? 0),
          wakeUpScreen: wakeUpScreen ?? true,
        ),
        actionButtons: actionButtons,
        localizations: localizations,
        schedule: interval ?? calendar,
      );

  static NotificationInterval createInterval({int? interval, bool? repeats, bool? preciseAlarm, bool? allowWhileIdle, String? timeZone}) =>
      NotificationInterval(
          interval: interval ?? 1,
          repeats: repeats ?? false,
          preciseAlarm: preciseAlarm ?? true,
          allowWhileIdle: allowWhileIdle ?? true,
          timeZone: timeZone);

  static NotificationCalendar createCalendar(
          {DateTime? dateTime,
          String? timeZone,
          bool? allowWhileIdle,
          bool? preciseAlarm,
          bool? repeats,
          int? era,
          int? weekday,
          int? weekOfMonth,
          int? weekOfYear}) =>
      NotificationCalendar(
          timeZone: timeZone,
          allowWhileIdle: allowWhileIdle ?? true,
          preciseAlarm: preciseAlarm ?? true,
          repeats: repeats ?? false,
          hour: dateTime?.hour,
          second: dateTime?.second,
          minute: dateTime?.minute,
          day: dateTime?.day,
          month: dateTime?.month,
          year: dateTime?.year,
          era: era,
          millisecond: dateTime?.millisecond,
          weekday: dateTime?.weekday,
          weekOfMonth: weekOfMonth,
          weekOfYear: weekOfYear);

  static NotificationActionButton createButton(
          {String? key,
          String? label,
          String? icon,
          bool? autoDismissible,
          ActionType? actionType,
          Color? color,
          bool? enabled,
          bool? isDangerousOption,
          bool? requireInputText,
          bool? showInCompactView}) =>
      NotificationActionButton(
          key: key ?? '',
          label: label ?? '',
          icon: icon,
          autoDismissible: autoDismissible ?? true,
          actionType: actionType ?? ActionType.Default,
          color: color ?? AppThemes.to.primaryColor,
          enabled: enabled ?? true,
          isDangerousOption: isDangerousOption ?? false,
          requireInputText: requireInputText ?? false,
          showInCompactView: showInCompactView ?? false);
}
