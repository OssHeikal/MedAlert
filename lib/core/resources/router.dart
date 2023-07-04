import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:med_alert/core/presentation/view/home_view.dart';
import 'package:med_alert/core/presentation/view/settings_view.dart';
import 'package:med_alert/core/presentation/view/welcome_view.dart';
import 'package:med_alert/core/resources/routes.dart';
import 'package:med_alert/core/utils/route_utils.dart';
import 'package:med_alert/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:med_alert/features/authentication/presentation/view/login_view.dart';
import 'package:med_alert/features/authentication/presentation/view/register_view.dart';

class AppRouter {
  final AuthBloc authBloc;
  late GoRouter router;

  AppRouter(this.authBloc) {
    router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppRoutes.welcome.path,
      routes: [
        GoRoute(
          path: AppRoutes.welcome.path,
          name: AppRoutes.welcome.name,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: WelcomeView()),
          routes: [
            GoRoute(
              path: AppRoutes.login.path,
              name: AppRoutes.login.name,
              pageBuilder: (context, state) =>
                  const CupertinoPage(child: LoginView()),
            ),
            GoRoute(
              path: AppRoutes.register.path,
              name: AppRoutes.register.name,
              pageBuilder: (context, state) =>
                  const CupertinoPage(child: RegisterView()),
            ),
          ],
        ),
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeView(authBloc: authBloc)),
          routes: [
            GoRoute(
              path: AppRoutes.setting.path,
              name: AppRoutes.setting.name,
              pageBuilder: (context, state) => NoTransitionPage(
                  child: SettingsView(authBloc: state.extra as AuthBloc)),
            ),
          ],
        ),
      ],
      redirect: (context, state) =>
          RouteUtils.handleRedirect(authBloc, context, state),
      refreshListenable: GoRouterRefreshStream(authBloc),
    );
  }
}
