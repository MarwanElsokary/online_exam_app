import 'package:exams/Core/RoutesManager/routes.dart';
import 'package:exams/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:exams/Features/Auth/Profile/presentation/pages/profile_screen.dart';
import 'package:exams/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:exams/Features/Home/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Home());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => Login());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => Signup());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
