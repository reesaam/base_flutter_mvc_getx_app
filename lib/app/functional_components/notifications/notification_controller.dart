import 'package:awesome_notifications/awesome_notifications.dart';

import '../../../core/core_functions.dart';

class NotificationController {

  @pragma("vm:entry-point")
  static onActionReceivedMethod(ReceivedAction receivedAction) {
    appDebugPrint(receivedAction.channelKey);
  }

  @pragma("vm:entry-point")
  static onDismissActionReceivedMethod(ReceivedAction receivedAction) {
    appDebugPrint(receivedAction.channelKey);
  }

  @pragma("vm:entry-point")
  static onNotificationCreatedMethod(ReceivedNotification receivedNotification) {
    appDebugPrint(receivedNotification.channelKey);
  }

  @pragma("vm:entry-point")
  static onNotificationDisplayedMethod(ReceivedNotification receivedNotification) {
    appDebugPrint(receivedNotification.channelKey);
  }
}