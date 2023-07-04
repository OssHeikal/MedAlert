import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:med_alert/core/resources/routes.dart';
import 'package:med_alert/core/utils/enums.dart';
import 'package:med_alert/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';

class RouteUtils {
  // final AuthBloc authBloc;

  // RouteUtils(this.authBloc);

  // String? handleRedirect(BuildContext context, GoRouterState state) {
  //   final isLoggedIn = authBloc.state.status == AppStatus.authenticated;
  //   final isOnHomePage = state.location == AppRoutes.home.path;

  //   if (isLoggedIn) {
  //     return AppRoutes.home.path;
  //   }

  //   if (!isLoggedIn && isOnHomePage) {
  //     return AppRoutes.welcome.path;
  //   }

  //   return null;
  // }

  // static String? handleRedirect(
  //   AuthBloc authBloc,
  //   BuildContext context,
  //   GoRouterState state,
  // ) {
  //   final isLoggedIn = authBloc.state.status == AppStatus.authenticated;
  //   final isOnWelcomePage = state.location == AppRoutes.welcome.path;
  //   final isOnLoginPage = state.location == AppRoutes.login.path;
  //   final isOnRegisterPage = state.location == AppRoutes.register.path;

  //   if (isLoggedIn && isOnWelcomePage) {
  //     return AppRoutes.home.path;
  //   }

  //   if (!isLoggedIn && !isOnWelcomePage) {
  //     return AppRoutes.welcome.path;
  //   }

  //   return null;
  // }

  static String? handleRedirect(
    AuthBloc authBloc,
    BuildContext context,
    GoRouterState state,
  ) {
    final isLoggedIn = authBloc.state.status == AppStatus.authenticated;
    final isOnWelcomePage = state.location == AppRoutes.welcome.path;
    final isOnLoginPage = state.matchedLocation.contains(AppRoutes.login.path);
    final isOnRegisterPage =
        state.matchedLocation.contains(AppRoutes.register.path);

    if (isLoggedIn) {
      if (isOnWelcomePage || isOnLoginPage || isOnRegisterPage) {
        return AppRoutes.home.path;
      }
    } else {
      if (!isOnWelcomePage && !isOnLoginPage && !isOnRegisterPage) {
        return AppRoutes.welcome.path;
      }
    }

    return null;
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(AuthBloc authBloc) {
    notifyListeners();
    _subscription = authBloc.stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
