import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';
import 'package:med_alert/features/medicine/domain/usecases/add_medicine_schedule_usecase.dart';
import 'package:med_alert/features/medicine/domain/usecases/delete_medicine_schedule_usecase.dart';

part 'medicine_schedule_event.dart';
part 'medicine_schedule_state.dart';

class MedicineScheduleBloc
    extends Bloc<MedicineScheduleEvent, MedicineScheduleState> {
  final AddPatientDataUseCase addPatientDataUseCase;
  final DeleteDispenserUseCase deleteDispenserUseCase;
  MedicineScheduleBloc(
    this.addPatientDataUseCase,
    this.deleteDispenserUseCase,
  ) : super(const MedicineScheduleState()) {
    on<MedicineScheduleAdded>(_onMedicineScheduleAdded);
    on<MedicineScheduleDeleted>(_onMedicineScheduleDeleted);
  }

  FutureOr<void> _onMedicineScheduleAdded(
      MedicineScheduleAdded event, Emitter<MedicineScheduleState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await addPatientDataUseCase(event.medicineSchedule);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.failure)),
      (_) => emit(state.copyWith(status: RequestStatus.success)),
    );
  }

  FutureOr<void> _onMedicineScheduleDeleted(MedicineScheduleDeleted event,
      Emitter<MedicineScheduleState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await deleteDispenserUseCase(event.medicineId);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.failure)),
      (_) => emit(state.copyWith(status: RequestStatus.success)),
    );
  }
}
