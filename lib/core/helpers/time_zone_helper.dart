import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TimeZoneHelper {
  static Future<void> init() async {
    tz.initializeTimeZones();
    // final location = await FlutterNativeTimezone.getLocalTimezone();
    // tz.setLocalLocation(tz.getLocation(location));
  }

  static tz.TZDateTime convertDateTimeToTimeZone(
      DateTime dateTime, String timeZone) {
    final location = tz.getLocation(timeZone);
    final convertedDateTime = tz.TZDateTime.from(dateTime, location);
    return convertedDateTime;
  }

  static tz.TZDateTime scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = DateTime(
        now.year, now.month, now.day, time.hour, time.minute, time.second);
    return scheduledDate.isBefore(now)
        ? tz.TZDateTime.from(
            scheduledDate.add(const Duration(days: 1)), tz.local)
        : tz.TZDateTime.from(scheduledDate, tz.local);
  }

  static tz.TZDateTime scheduleWeekly(Time time, {required int weekday}) {
    tz.TZDateTime scheduledDate = scheduleDaily(time);
    while (scheduledDate.weekday != weekday) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
