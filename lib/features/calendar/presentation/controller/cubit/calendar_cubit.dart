import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarCubit extends Cubit<DateTime> {
  CalendarCubit() : super(DateTime.now());
  void changeSelectedDate(DateTime selectedDate) {
    emit(selectedDate);
  }
}
