import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:med_alert/core/data/remote/network_connection.dart';
import 'package:med_alert/core/resources/router.dart';
import 'package:med_alert/core/services/local_notification_services.dart';
import 'package:med_alert/core/utils/route_utils.dart';
import 'package:med_alert/features/authentication/core/auth_dependencies.dart';
import 'package:med_alert/features/calendar/core/calendar_dependencies.dart';
import 'package:med_alert/features/medicine/core/medicine_dependencies.dart';
import 'package:med_alert/features/notifications/core/notification_dependencies.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static init() {
    // Core
    sl.registerFactory(() => FirebaseAuth.instance);
    sl.registerFactory(() => NetworkConnection());
    sl.registerLazySingleton(() => AppRouter(sl()));
    sl.registerLazySingleton(() => GoRouterRefreshStream(sl()));
    sl.registerLazySingleton(() => LocalNotificationServices());

    AuthDependencies.registerDependencies();
    CalendarDependencies.registerDependencies();
    MedicineDependencies.registerDependencies();
    NotificationDependencies.registerDependencies();
  }
}
