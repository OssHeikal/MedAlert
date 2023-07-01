import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_pill/core/helpers/time_zone_helper.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationServices {
  static FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  static Future<void> init({required bool initSchedule}) async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const setting = InitializationSettings(android: android, iOS: ios);
    await notification.initialize(setting);
    if (initSchedule) {
      await TimeZoneHelper.init();
    }
  }

  static Future<NotificationDetails> getNotificationDetails() async {
    const androidPlatformChannel = AndroidNotificationDetails(
      "channel id",
      "channel name",
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannel = DarwinNotificationDetails();
    return const NotificationDetails(
        android: androidPlatformChannel, iOS: iOSPlatformChannel);
  }

  static Future<void> scheduleNotification(
    int id,
    String title,
    String body,
    tz.TZDateTime scheduledDate,
  ) async {
    final notificationDetails = await getNotificationDetails();
    await notification.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await notification.cancel(id);
  }
}
