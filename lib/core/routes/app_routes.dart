
import 'package:asroo_store_app/core/common/screens/under_build_screen.dart';
import 'package:asroo_store_app/core/routes/base_routes.dart';
import 'package:asroo_store_app/features/login.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String login = 'login';


  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const Login());

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
