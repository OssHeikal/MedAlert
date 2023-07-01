import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/usecases/add_dispenser_to_realtime_db_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/add_patient_data_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/delete_dispenser_from_realtime_db_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/delete_dispenser_usecase.dart';

part 'new_dispenser_event.dart';
part 'new_dispenser_state.dart';

class NewDispenserBloc extends Bloc<AddPatientEvent, NewDispenserState> {
  final AddPatientDataUseCase addPatientDataUseCase;
  final DeleteDispenserUseCase deleteDispenserUseCase;
  final AddDispenserToRealTimeDBUseCase addDispenserToRealTimeDBUseCase;
  final DeleteDispenserFromRealtimeDBUseCase deleteDispenserToRealTimeDBUseCase;
  NewDispenserBloc(
    this.addPatientDataUseCase,
    this.deleteDispenserUseCase,
    this.addDispenserToRealTimeDBUseCase,
    this.deleteDispenserToRealTimeDBUseCase,
  ) : super(const NewDispenserState()) {
    on<DispenserAdded>(_onPatientDataAdded);
    on<DispenserDeleted>(_onDispenserDeleted);
  }

  FutureOr<void> _onPatientDataAdded(
      DispenserAdded event, Emitter<NewDispenserState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    await addDispenserToRealTimeDBUseCase(event.dispenser);
    final result = await addPatientDataUseCase(event.dispenser);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.failure)),
      (_) => emit(state.copyWith(status: RequestStatus.success)),
    );
  }

  FutureOr<void> _onDispenserDeleted(
      DispenserDeleted event, Emitter<NewDispenserState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    await deleteDispenserToRealTimeDBUseCase(event.index);
    final result = await deleteDispenserUseCase(event.dispenserId);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.failure)),
      (_) => emit(state.copyWith(status: RequestStatus.success)),
    );
  }
}
