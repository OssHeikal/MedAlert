import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pill/core/resorces/routes.dart';
import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';

class RouteUtils {
  final AuthBloc authBloc;

  RouteUtils(this.authBloc);

  String? handleRedirect(BuildContext context, GoRouterState state) {
    final isLoggedIn = authBloc.state.status == AppStatus.authenticated;
    final isOnHomePage = state.location == AppRoutes.home.path;

    if (isLoggedIn) {
      return AppRoutes.home.path;
    }

    if (!isLoggedIn && isOnHomePage) {
      return AppRoutes.welcome.path;
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
