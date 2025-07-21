import 'package:flutter/material.dart';
import 'package:online_exam/Core/RoutesManager/routes.dart';
import 'package:online_exam/Features/Auth/Login/presentation/pages/Login.dart';
import 'package:online_exam/Features/Auth/Sign_up/presentation/pages/sign_up%20screen.dart';
import 'package:online_exam/Features/Home/home.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Home());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  Login());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => Signup());
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
