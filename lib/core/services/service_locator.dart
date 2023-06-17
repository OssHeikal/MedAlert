import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_pill/core/data/remote/network_connection.dart';
import 'package:smart_pill/core/resorces/router.dart';
import 'package:smart_pill/core/utils/route_utils.dart';
import 'package:smart_pill/features/authentication/data/datasource/auth_datasource.dart';
import 'package:smart_pill/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:smart_pill/features/authentication/domain/repositories/auth_repository.dart';
import 'package:smart_pill/features/authentication/domain/usecases/get_user_profile_usecase.dart';
import 'package:smart_pill/features/authentication/domain/usecases/user_state_change_usecase.dart';
import 'package:smart_pill/features/authentication/domain/usecases/login_usecase.dart';
import 'package:smart_pill/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:smart_pill/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:smart_pill/features/authentication/presentation/controller/login/cubit/login_cubit.dart';
import 'package:smart_pill/features/authentication/presentation/controller/sign_up/cubit/sign_up_cubit.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // Core
    sl.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
    sl.registerFactory<NetworkConnection>(() => NetworkConnection());
    sl.registerLazySingleton<AppRouter>(() => AppRouter(sl(), sl(), sl()));
    sl.registerLazySingleton<GoRouterRefreshStream>(
        () => GoRouterRefreshStream(sl()));
    sl.registerLazySingleton<RouteUtils>(() => RouteUtils(sl()));

    // Data Sources
    sl.registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImpl(sl(), sl()));

    // Repositories
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(sl()));
    sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(sl()));
    sl.registerLazySingleton<UserStateChangeUseCase>(
        () => UserStateChangeUseCase(sl()));
    sl.registerLazySingleton<GetUserProfileUseCase>(
        () => GetUserProfileUseCase(sl()));

    // Bloc
    sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl()));

    //Cubit
    sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
    sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  }
}
