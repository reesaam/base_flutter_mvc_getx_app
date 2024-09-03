abstract class AppNotificationsRepository {
  init();
  Future<bool> simple({
    String? title,
    String? bigPicture,
    String? body,
    String? icon,
    String? largeIcon,
    int? timeoutAfterLongSeconds,
    bool? wakeUpScreen,
  });
  Future<bool> scheduled();
  Future<bool> intervalBased();
  Future<bool> specificTimeDaily();
  Future<bool> specificTimeWeekly();
  Future<bool> specificTimeMonthly();
  Future<bool> specificTimeYearly();
}