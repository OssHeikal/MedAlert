part of 'medicine_schedule_bloc.dart';

class MedicineScheduleState extends Equatable {
  const MedicineScheduleState({
    this.status = RequestStatus.initial,
    this.message = '',
  });

  final RequestStatus status;
  final String message;

  MedicineScheduleState copyWith({
    RequestStatus? status,
    String? message,
  }) {
    return MedicineScheduleState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}
