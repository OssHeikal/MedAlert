part of 'all_medicines_schedule_bloc.dart';

abstract class AllMedicinesScheduleEvent extends Equatable {
  const AllMedicinesScheduleEvent();

  @override
  List<Object> get props => [];
}

class AllDispensersFetched extends AllMedicinesScheduleEvent {
  const AllDispensersFetched({required this.dispensers});
  final List<MedicineSchedule> dispensers;

  @override
  List<Object> get props => [dispensers];
}
