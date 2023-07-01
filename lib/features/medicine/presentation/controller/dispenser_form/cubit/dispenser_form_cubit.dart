import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_pill/core/helpers/date_time_formatter.dart';
import 'package:smart_pill/core/utils/enums.dart';

part 'dispenser_form_state.dart';

class DispenserFormCubit extends Cubit<DispenserFormState> {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final List<int> weekdays = [
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
    DateTime.sunday
  ];

  final List<String> weekdaysNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  final List<String> timeIntervals = [
    for (int hour = 0; hour < 24; hour++)
      for (int minute = 0; minute < 60; minute += 30)
        '${(hour % 12 == 0 ? 12 : hour % 12).toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${hour < 12 ? 'AM' : 'PM'}',
  ];

  DispenserFormCubit()
      : super(DispenserFormState(selectedTime: DateTime.now()));

  void setId() {
    emit(state.copyWith(id: idController.text));
  }

  void setMedicine() {
    emit(state.copyWith(medicine: medicineNameController.text));
  }

  void incrementDose() {
    emit(state.copyWith(dose: state.dose + 1));
  }

  void decrementDose() {
    emit(state.copyWith(dose: state.dose - 1));
  }

  void toggleMedicineType() {
    if (state.type == MedicineType.capsule) {
      emit(state.copyWith(type: MedicineType.tablet));
    } else {
      emit(state.copyWith(type: MedicineType.capsule));
    }
  }

  // void toggleDaySelection(int weekday) {
  //   List<int> currentSelection = List.from(state.selectedDays);
  //   if (currentSelection.contains(weekday)) {
  //     currentSelection.remove(weekday);
  //   } else {
  //     currentSelection.add(weekday);
  //   }
  //   emit(state.copyWith(selectedDays: List.from(currentSelection)));
  // }
  void toggleDaySelection(int weekday) {
    List<int> currentSelection = List.from(state.selectedDays);
    if (currentSelection.length == 1 && currentSelection.contains(weekday)) {
      // If the selected day is already the only one selected, do nothing
      return;
    } else {
      currentSelection.clear();
      currentSelection.add(weekday);
    }
    emit(state.copyWith(selectedDays: List.from(currentSelection)));
  }

  void toggleTimeSelection(String time) {
    List<String> currentSelection = List.from(state.selectedTimes);
    if (currentSelection.contains(time)) {
      currentSelection.remove(time);
    } else {
      currentSelection.add(time);
    }
    emit(state.copyWith(selectedTimes: List.from(currentSelection)));
  }

  void onDateTimeChanged(DateTime dateTime) {
    emit(state.copyWith(
      selectedTime: dateTime,
      selectedTimes: [DateTimeFormatter.formatDateTime(dateTime)],
    ));
  }
}
