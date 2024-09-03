import '../app_notifications_enums.dart';
import '../app_notifications_repository.dart';
import 'app_local_notifications_repository.dart';

class AppLocalNotifications extends AppNotificationsRepository {
  @override
  init() async => await AppLocalNotificationsRepository().init();

  @override
  Future<bool> simple({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  }) async {
    var result = await AppLocalNotificationsRepository().createNotification(
      channelKey: AppNotificationChannelKey.simple,
      title: title,
      bigPicture: bigPicture,
      body: body,
      icon: icon,
      largeIcon: largeIcon,
      timeoutAfterLongSeconds: timeoutAfterLongSeconds,
      wakeUpScreen: wakeUpScreen,
    );
    return result;
  }

  @override
  Future<bool> scheduled() async {return false;}
  @override
  Future<bool> intervalBased() async {return false;}
  @override
  Future<bool> specificTimeDaily() async {return false;}
  @override
  Future<bool> specificTimeWeekly() async {return false;}
  @override
  Future<bool> specificTimeMonthly() async {return false;}
  @override
  Future<bool> specificTimeYearly() async {return false;}
}
