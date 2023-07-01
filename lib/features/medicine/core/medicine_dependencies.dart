import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/features/medicine/data/datasource/remote/medicine_realtime_datasource.dart';
import 'package:smart_pill/features/medicine/data/datasource/remote/medicine_remote_datasource.dart';
import 'package:smart_pill/features/medicine/data/repository/medicine_repository_impl.dart';
import 'package:smart_pill/features/medicine/domain/repositories/medicine_repository.dart';
import 'package:smart_pill/features/medicine/domain/usecases/add_dispenser_to_realtime_db_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/add_patient_data_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/delete_dispenser_from_realtime_db_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/delete_dispenser_usecase.dart';
import 'package:smart_pill/features/medicine/domain/usecases/get_dispenser_stream_usecase.dart';
import 'package:smart_pill/features/medicine/presentation/controller/all_dispensers/bloc/all_dispensers_bloc.dart';
import 'package:smart_pill/features/medicine/presentation/controller/calendar/cubit/calendar_cubit.dart';
import 'package:smart_pill/features/medicine/presentation/controller/dispenser_form/cubit/dispenser_form_cubit.dart';
import 'package:smart_pill/features/medicine/presentation/controller/medicine/cubit/medicine_cubit.dart';
import 'package:smart_pill/features/medicine/presentation/controller/new_dispenser/bloc/new_dispenser_bloc.dart';

class MedicineDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<MedicineRemoteDataSource>(
        () => MedicineRemoteDataSourceImpl());
    sl.registerLazySingleton<MedicineRealTimeDataSource>(
        () => MedicineRealTimeDataSourceImpl());

    // Repositories
    sl.registerLazySingleton<MedicineRepository>(
        () => MedicineRepositoryImpl(sl(), sl()));

    // Use cases
    sl.registerLazySingleton(() => AddPatientDataUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDispenserUseCase(sl()));
    sl.registerLazySingleton(() => GetDispenserStreamUseCase(sl()));
    sl.registerLazySingleton(() => AddDispenserToRealTimeDBUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDispenserFromRealtimeDBUseCase(sl()));

    // Bloc
    sl.registerFactory<AllDispensersBloc>(() => AllDispensersBloc(sl(), sl()));
    sl.registerFactory<NewDispenserBloc>(
        () => NewDispenserBloc(sl(), sl(), sl(), sl()));

    // Cubit
    sl.registerFactory<DispenserFormCubit>(() => DispenserFormCubit());
    sl.registerFactory<MedicineCubit>(() => MedicineCubit(sl(), sl()));
    sl.registerLazySingleton<CalendarCubit>(() => CalendarCubit());
  }
}
