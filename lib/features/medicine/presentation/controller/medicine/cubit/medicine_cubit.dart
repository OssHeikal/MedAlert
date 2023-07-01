import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_pill/core/helpers/date_time_formatter.dart';
import 'package:smart_pill/features/medicine/domain/entities/despinser.dart';
import 'package:smart_pill/features/medicine/domain/entities/medicine.dart';
import 'package:smart_pill/features/medicine/presentation/controller/all_dispensers/bloc/all_dispensers_bloc.dart';
import 'package:smart_pill/features/medicine/presentation/controller/calendar/cubit/calendar_cubit.dart';

part 'medicine_state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  final AllDispensersBloc allDispensersBloc;
  late StreamSubscription<AllDispensersState> allDispensersSubscription;

  final CalendarCubit calendarCubit;
  late StreamSubscription<DateTime> calendarSubscription;
  MedicineCubit(
    this.allDispensersBloc,
    this.calendarCubit,
  ) : super(const MedicineState()) {
    allDispensersSubscription = allDispensersBloc.stream.listen((state) {
      getMedicinesForCurrentWeekday(
          state.dispensers, calendarCubit.state.weekday);
    });
    calendarSubscription = calendarCubit.stream.listen((state) {
      getMedicinesForCurrentWeekday(
          allDispensersBloc.state.dispensers, state.weekday);
    });
  }

  void getMedicinesForCurrentWeekday(
      List<Dispenser> dispensers, int currentWeekday) {
    List<Medicine> medicines = [];

    for (final Dispenser dispenser in dispensers) {
      if (dispenser.schedule.days.contains(currentWeekday)) {
        for (final time in dispenser.schedule.times) {
          medicines.add(
            Medicine(
              name: dispenser.medicine,
              type: dispenser.type,
              dose: dispenser.dose,
              time: time,
            ),
          );
        }
      }
    }
    medicines.sort((a, b) {
      final aTime = DateTimeFormatter.extractTime(a.time);
      final bTime = DateTimeFormatter.extractTime(b.time);
      return aTime.compareTo(bTime);
    });
    emit(state.copyWith(medicines: medicines, currentWeekday: currentWeekday));
  }

  @override
  Future<void> close() {
    allDispensersSubscription.cancel();
    calendarSubscription.cancel();
    return super.close();
  }
}
