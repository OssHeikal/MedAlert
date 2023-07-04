import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/features/medicine/data/datasource/remote/medicine_remote_datasource.dart';
import 'package:med_alert/features/medicine/data/repository/medicine_repository_impl.dart';
import 'package:med_alert/features/medicine/domain/repositories/medicine_repository.dart';
import 'package:med_alert/features/medicine/domain/usecases/add_medicine_schedule_usecase.dart';
import 'package:med_alert/features/medicine/domain/usecases/delete_medicine_schedule_usecase.dart';
import 'package:med_alert/features/medicine/domain/usecases/get_all_medicines_stream_usecase.dart';
import 'package:med_alert/features/medicine/presentation/controller/all_medicines_schedule/bloc/all_medicines_schedule_bloc.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine/cubit/medicine_cubit.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine_form/cubit/medicine_form_cubit.dart';
import 'package:med_alert/features/medicine/presentation/controller/medicine_schedule/bloc/medicine_schedule_bloc.dart';

class MedicineDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<MedicineRemoteDataSource>(
        () => MedicineRemoteDataSourceImpl());

    // Repositories
    sl.registerLazySingleton<MedicineRepository>(
        () => MedicineRepositoryImpl(sl()));

    // Use cases
    sl.registerLazySingleton(() => AddPatientDataUseCase(sl()));
    sl.registerLazySingleton(() => DeleteDispenserUseCase(sl()));
    sl.registerLazySingleton(() => GetDispenserStreamUseCase(sl()));

    // Bloc
    sl.registerFactory<AllMedicinesScheduleBloc>(
        () => AllMedicinesScheduleBloc(sl(), sl()));
    sl.registerFactory<MedicineScheduleBloc>(
        () => MedicineScheduleBloc(sl(), sl()));

    // Cubit
    sl.registerFactory<MedicineFormCubit>(() => MedicineFormCubit());
    sl.registerFactory<MedicineCubit>(() => MedicineCubit(sl(), sl()));
  }
}
