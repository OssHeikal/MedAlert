part of 'notification_bloc.dart';

enum NotificationStatus {
  initial,
  scheduling,
  scheduled,
  canceling,
  canceled,
  failure
}

class NotificationState extends Equatable {
  const NotificationState({
    this.status = NotificationStatus.initial,
  });

  final NotificationStatus status;

  NotificationState copyWith({
    NotificationStatus? status,
  }) {
    return NotificationState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
