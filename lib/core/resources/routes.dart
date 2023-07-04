enum AppRoutes {
  welcome,
  login,
  register,
  home,
  setting,
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
      case AppRoutes.setting:
        return 'setting';
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
      case AppRoutes.setting:
        return 'setting';
      default:
        return 'Welcome';
    }
  }
}
