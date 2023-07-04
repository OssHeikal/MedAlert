import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/features/calendar/presentation/controller/cubit/calendar_cubit.dart';

class CalendarDependencies {
  static void registerDependencies() {
    sl.registerLazySingleton<CalendarCubit>(() => CalendarCubit());
  }
}
