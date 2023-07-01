import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pill/core/presentation/view/header_widget.dart';

import 'package:smart_pill/core/presentation/view/home_view.dart';
import 'package:smart_pill/core/presentation/view/welcome_view.dart';
import 'package:smart_pill/core/resources/routes.dart';
import 'package:smart_pill/core/utils/route_utils.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:smart_pill/features/authentication/presentation/view/login_view.dart';
import 'package:smart_pill/features/authentication/presentation/view/register_view.dart';
import 'package:smart_pill/features/notifications/presentation/view/notification_view.dart';

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
              path: AppRoutes.notification.path,
              name: AppRoutes.notification.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: NotificationsView()),
            ),
            GoRoute(
              path: AppRoutes.profile.path,
              name: AppRoutes.profile.name,
              pageBuilder: (context, state) => NoTransitionPage(
                  child: ProfileView(authBloc: state.extra as AuthBloc)),
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
