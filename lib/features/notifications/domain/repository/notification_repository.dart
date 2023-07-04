import 'package:dartz/dartz.dart';
import 'package:med_alert/core/data/error/failure.dart';
import 'package:med_alert/features/medicine/domain/entities/schedule.dart';
import 'package:med_alert/features/notifications/domain/entities/notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, Unit>> scheduleWeeklyNotification(
      NotificationData notificationData);
  Future<Either<Failure, Unit>> cancelNotification(int id, Schedule schedule);
}
