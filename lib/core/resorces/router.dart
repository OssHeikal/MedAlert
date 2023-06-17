import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'package:smart_pill/core/presentation/view/home_view.dart';
import 'package:smart_pill/core/presentation/view/welcome_view.dart';
import 'package:smart_pill/core/resorces/routes.dart';
import 'package:smart_pill/core/utils/route_utils.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';
import 'package:smart_pill/features/authentication/presentation/view/login_view.dart';
import 'package:smart_pill/features/authentication/presentation/view/register_view.dart';

class AppRouter {
  final AuthBloc authBloc;
  final RouteUtils routeUtils;
  final GoRouterRefreshStream refreshStream;
  late GoRouter router;

  AppRouter(this.authBloc, this.routeUtils, this.refreshStream) {
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
        ),
      ],
      redirect: (context, state) => routeUtils.handleRedirect(context, state),
      refreshListenable: refreshStream,
    );
  }
}


// (context, state) {
//         final isLoggedIn = authBloc.state.status == AppStatus.authenticated;
//         final isOnHomePage = state.location == AppRoutes.home.path;

//         if (isLoggedIn) {
//           return AppRoutes.home.path;
//         }

//         if (!isLoggedIn && isOnHomePage) {
//           return AppRoutes.welcome.path;
//         }

//         return null;
//       },