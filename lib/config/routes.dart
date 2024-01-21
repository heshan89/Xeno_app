import 'package:flutter/material.dart';
import 'package:xenov1/pages/dashboard.dart';
import 'package:xenov1/pages/login.dart';
import 'package:xenov1/splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.home: (context) => const Login(),
      AppRoutes.dashboard: (context) => const Dashboard(),
    };
  }
}
