import 'package:med_alert/core/services/service_locator.dart';
import 'package:med_alert/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:med_alert/features/authentication/domain/repositories/auth_repository.dart';
import 'package:med_alert/features/authentication/domain/usecases/get_user_profile_usecase.dart';
import 'package:med_alert/features/authentication/domain/usecases/login_usecase.dart';
import 'package:med_alert/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:med_alert/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:med_alert/features/authentication/domain/usecases/user_state_change_usecase.dart';
import 'package:med_alert/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:med_alert/features/authentication/presentation/controller/login/cubit/login_cubit.dart';
import 'package:med_alert/features/authentication/presentation/controller/sign_up/cubit/sign_up_cubit.dart';

import '../data/datasource/auth_datasource.dart';

class AuthDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImpl(sl(), sl()));

    // Repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    // Use cases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));
    sl.registerLazySingleton(() => UserStateChangeUseCase(sl()));
    sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));

    // Bloc
    sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));

    // Cubit
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  }
}
