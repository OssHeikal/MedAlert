part of 'all_medicines_schedule_bloc.dart';

class AllMedicinesScheduleState extends Equatable {
  const AllMedicinesScheduleState({
    this.status = RequestStatus.initial,
    this.message = '',
    this.dispensers = const [],
    // this.patient = const Patient.empty(),
  });
  final RequestStatus status;
  final String message;
  // final Patient patient;
  final List<MedicineSchedule> dispensers;

  AllMedicinesScheduleState copyWith({
    RequestStatus? status,
    String? message,
    // Patient? patient,
    List<MedicineSchedule>? dispensers,
  }) {
    return AllMedicinesScheduleState(
      status: status ?? this.status,
      message: message ?? this.message,
      dispensers: dispensers ?? this.dispensers,
      // patient: patient ?? this.patient,
    );
  }

  @override
  List<Object> get props => [status, message, dispensers];
}
