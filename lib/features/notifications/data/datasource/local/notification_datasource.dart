import 'package:dartz/dartz.dart';
import 'package:med_alert/core/data/error/exceptions.dart';
import 'package:med_alert/core/helpers/time_zone_helper.dart';
import 'package:med_alert/core/services/local_notification_services.dart';
import 'package:med_alert/features/medicine/domain/entities/schedule.dart';
import 'package:med_alert/features/notifications/domain/entities/notification.dart';

abstract class LocalNotificationDataSource {
  Future<Unit> scheduleWeeklyNotification(NotificationData notificationData);
  Future<Unit> cancelNotification(int id, Schedule schedule);
}

class LocalNotificationDataSourceImpl extends LocalNotificationDataSource {
  LocalNotificationDataSourceImpl(this.notificationServices);
  final LocalNotificationServices notificationServices;
  @override
  Future<Unit> scheduleWeeklyNotification(
      NotificationData notificationData) async {
    try {
      final scheduledDates = TimeZoneHelper.scheduleMultipleWeekly(
        notificationData.schedule.times,
        notificationData.schedule.days,
      );
      await LocalNotificationServices.scheduleNotification(
        notificationData.id,
        notificationData.title,
        notificationData.body,
        scheduledDates,
      );
      return unit;
    } catch (e) {
      throw NotifierException();
    }
  }

  @override
  Future<Unit> cancelNotification(int id, Schedule schedule) async {
    try {
      final scheduledDates = TimeZoneHelper.scheduleMultipleWeekly(
        schedule.times,
        schedule.days,
      );
      await LocalNotificationServices.cancelNotification(id, scheduledDates);
      return unit;
    } catch (e) {
      throw NotifierException();
    }
  }
}
