import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';
import 'package:smart_pill/features/notifications/data/datasource/local/notification_datasource.dart';
import 'package:smart_pill/features/notifications/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl(this.localNotificationDataSource);
  final LocalNotificationDataSource localNotificationDataSource;

  @override
  Future<Either<Failure, Unit>> scheduleWeeklyNotification(
    int id,
    String title,
    String body,
    Schedule schedule,
  ) async {
    try {
      await localNotificationDataSource.scheduleWeeklyNotification(
          id, title, body, schedule);
      return right(unit);
    } catch (e) {
      return left(NotificationFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelNotification(int id) async {
    try {
      await localNotificationDataSource.cancelNotification(id);
      return right(unit);
    } catch (e) {
      return left(NotificationFailure());
    }
  }
}
