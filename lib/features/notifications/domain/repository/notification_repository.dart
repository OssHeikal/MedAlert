import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/features/medicine/domain/entities/schedule.dart';

abstract class NotificationRepository {
  Future<Either<Failure, Unit>> scheduleWeeklyNotification(
    int id,
    String title,
    String body,
    Schedule schedule,
  );
  Future<Either<Failure, Unit>> cancelNotification(int id);
}
