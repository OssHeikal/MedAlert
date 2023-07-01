import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/features/notifications/data/datasource/local/notification_datasource.dart';
import 'package:smart_pill/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:smart_pill/features/notifications/domain/repository/notification_repository.dart';
import 'package:smart_pill/features/notifications/domain/usecases/cancel_notificiation_usecase.dart';
import 'package:smart_pill/features/notifications/domain/usecases/schedule_weekly_notification_usecase.dart';
import 'package:smart_pill/features/notifications/presentation/controller/bloc/notification_bloc.dart';

class NotificationDependencies {
  static void registerDependencies() {
    // Data sources
    sl.registerLazySingleton<LocalNotificationDataSource>(
        () => LocalNotificationDataSourceImpl(sl()));

    // Repositories
    sl.registerLazySingleton<NotificationRepository>(
        () => NotificationRepositoryImpl(sl()));

    // Use cases
    sl.registerLazySingleton(() => ScheduleWeeklyNotificationUseCase(sl()));
    sl.registerLazySingleton(() => CancelNotificationUseCase(sl()));

    // Bloc
    sl.registerFactory(() => NotificationBloc(sl(), sl()));
  }
}
