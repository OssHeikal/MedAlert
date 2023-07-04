import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:med_alert/features/medicine/domain/entities/medicine_schedule.dart';
import 'package:med_alert/features/medicine/domain/usecases/get_all_medicines_stream_usecase.dart';

part 'all_medicines_schedule_event.dart';
part 'all_medicines_schedule_state.dart';

class AllMedicinesScheduleBloc
    extends Bloc<AllMedicinesScheduleEvent, AllMedicinesScheduleState> {
  final AuthBloc authBloc;
  late StreamSubscription<AuthState> authSubscription;
  final GetDispenserStreamUseCase getDispenserStreamUseCase;
  late StreamSubscription<List<MedicineSchedule>> patientSubscription;
  AllMedicinesScheduleBloc(
    this.authBloc,
    this.getDispenserStreamUseCase,
  ) : super(const AllMedicinesScheduleState()) {
    on<AllDispensersFetched>(_onAllDispensersFetched);

    authSubscription = authBloc.stream.listen((authState) {
      String patientId = authState.user.id!;
      patientSubscription =
          getDispenserStreamUseCase(patientId).listen((dispensers) {
        add(AllDispensersFetched(dispensers: dispensers));
      });
    });
  }
  FutureOr<void> _onAllDispensersFetched(
    AllDispensersFetched event,
    Emitter<AllMedicinesScheduleState> emit,
  ) {
    emit(state.copyWith(status: RequestStatus.loading));

    emit(state.copyWith(
        status: RequestStatus.success, dispensers: event.dispensers));
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    patientSubscription.cancel();
    return super.close();
  }
}
