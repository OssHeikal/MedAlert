import 'package:dartz/dartz.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_pill/core/data/error/exceptions.dart';
import 'package:smart_pill/core/helpers/time_zone_helper.dart';
import 'package:smart_pill/core/services/local_notification_services.dart';
import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';

abstract class LocalNotificationDataSource {
  Future<Unit> scheduleWeeklyNotification(
    int id,
    String title,
    String body,
    // String payload,
    Schedule schedule,
  );
  Future<Unit> cancelNotification(int id);
}

class LocalNotificationDataSourceImpl extends LocalNotificationDataSource {
  LocalNotificationDataSourceImpl(this.notificationServices);
  final LocalNotificationServices notificationServices;
  @override
  Future<Unit> scheduleWeeklyNotification(
    int id,
    String title,
    String body,
    // String payload,
    Schedule schedule,
  ) async {
    print('scheduleWeeklyNotification : ${schedule.time!.hour}');
    try {
      await LocalNotificationServices.scheduleNotification(
        id,
        title,
        body,
        TimeZoneHelper.scheduleWeekly(
          Time(schedule.time!.hour, schedule.time!.minute),
          weekday: schedule.days.first,
        ),
      );
      return unit;
    } catch (e) {
      throw NotifierException();
    }
  }

  @override
  Future<Unit> cancelNotification(int id) async {
    try {
      await LocalNotificationServices.cancelNotification(id);
      return unit;
    } catch (e) {
      throw NotifierException();
    }
  }
}
