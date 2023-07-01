import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/features/notifications/domain/entities/notification.dart';
import 'package:smart_pill/features/notifications/domain/repository/notification_repository.dart';

class ScheduleWeeklyNotificationUseCase {
  final NotificationRepository _notificationRepository;

  ScheduleWeeklyNotificationUseCase(this._notificationRepository);

  Future<Either<Failure, Unit>> call(NotificationData params) async {
    return await _notificationRepository.scheduleWeeklyNotification(
        params.id, params.title, params.body, params.schedule);
  }
}
