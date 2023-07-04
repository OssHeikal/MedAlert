part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class WeeklyNotificationScheduled extends NotificationEvent {
  const WeeklyNotificationScheduled({required this.notification});

  final NotificationData notification;
  @override
  List<Object> get props => [notification];
}

class NotificationCanceled extends NotificationEvent {
  const NotificationCanceled({required this.id, required this.schedule});

  final int id;
  final Schedule schedule;
  @override
  List<Object> get props => [id, schedule];
}
