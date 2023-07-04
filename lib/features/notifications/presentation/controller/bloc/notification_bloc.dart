import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:med_alert/features/medicine/domain/entities/schedule.dart';
import 'package:med_alert/features/notifications/domain/entities/notification.dart';
import 'package:med_alert/features/notifications/domain/usecases/cancel_notificiation_usecase.dart';
import 'package:med_alert/features/notifications/domain/usecases/schedule_weekly_notification_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ScheduleWeeklyNotificationUseCase scheduelWeeklyNotificationUseCase;
  final CancelNotificationUseCase cancelNotificationUseCase;
  NotificationBloc(
    this.scheduelWeeklyNotificationUseCase,
    this.cancelNotificationUseCase,
  ) : super(const NotificationState()) {
    on<WeeklyNotificationScheduled>(_onWeeklyNotificationScheduled);
    on<NotificationCanceled>(_onNotificationCanceled);
  }

  FutureOr<void> _onWeeklyNotificationScheduled(
      WeeklyNotificationScheduled event,
      Emitter<NotificationState> emit) async {
    emit(state.copyWith(status: NotificationStatus.scheduling));
    final result = await scheduelWeeklyNotificationUseCase(event.notification);
    result.fold(
      (failure) => emit(state.copyWith(status: NotificationStatus.failure)),
      (_) => emit(state.copyWith(status: NotificationStatus.scheduled)),
    );
  }

  FutureOr<void> _onNotificationCanceled(
      NotificationCanceled event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(status: NotificationStatus.canceling));
    final result = await cancelNotificationUseCase(event.id, event.schedule);
    result.fold(
      (failure) => emit(state.copyWith(status: NotificationStatus.failure)),
      (_) => emit(state.copyWith(status: NotificationStatus.canceled)),
    );
  }
}
