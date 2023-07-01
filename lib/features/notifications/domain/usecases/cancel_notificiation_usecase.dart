import 'package:dartz/dartz.dart';
import 'package:smart_pill/core/data/error/failure.dart';
import 'package:smart_pill/features/notifications/domain/repository/notification_repository.dart';

class CancelNotificationUseCase {
  final NotificationRepository notificationRepository;

  CancelNotificationUseCase(this.notificationRepository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await notificationRepository.cancelNotification(id);
  }
}
