import 'package:med_alert/core/resources/router.dart';
import 'package:med_alert/core/resources/theme.dart';
import 'package:med_alert/core/services/bloc_observer.dart';
import 'package:med_alert/core/services/local_notification_services.dart';
import 'package:med_alert/core/services/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  ServiceLocator.init();
  LocalNotificationServices.init(initSchedule: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: sl<AppRouter>().router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeData(),
        );
      },
    );
  }
}
