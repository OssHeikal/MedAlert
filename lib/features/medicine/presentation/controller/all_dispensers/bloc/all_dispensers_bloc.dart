import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/usecases/get_dispenser_stream_usecase.dart';

part 'all_dispensers_event.dart';
part 'all_dispensers_state.dart';

class AllDispensersBloc extends Bloc<AllDispensersEvent, AllDispensersState> {
  final AuthBloc authBloc;
  late StreamSubscription<AuthState> authSubscription;
  final GetDispenserStreamUseCase getDispenserStreamUseCase;
  late StreamSubscription<List<Dispenser>> patientSubscription;
  AllDispensersBloc(
    this.authBloc,
    this.getDispenserStreamUseCase,
  ) : super(const AllDispensersState()) {
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
    Emitter<AllDispensersState> emit,
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
