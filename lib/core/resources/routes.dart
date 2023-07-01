enum AppRoutes {
  welcome,
  login,
  register,
  home,
  profile,
  notification,
}

extension AppRoutesX on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.welcome:
        return '/welcome';
      case AppRoutes.login:
        return 'login';
      case AppRoutes.register:
        return 'register';
      case AppRoutes.home:
        return '/home';
      case AppRoutes.profile:
        return 'profile';
      case AppRoutes.notification:
        return 'add_dispenser';
      default:
        return '/welcome';
    }
  }

  String get name {
    switch (this) {
      case AppRoutes.welcome:
        return 'Welcome';
      case AppRoutes.login:
        return 'Login';
      case AppRoutes.register:
        return 'Register';
      case AppRoutes.home:
        return 'Home';
      case AppRoutes.profile:
        return 'Profile';
      case AppRoutes.notification:
        return 'add_dispenser';
      default:
        return 'Welcome';
    }
  }
}
