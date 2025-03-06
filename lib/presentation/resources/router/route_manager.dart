import 'package:chikitsa_assign/presentation/screens/home/view.dart';
import 'package:chikitsa_assign/presentation/screens/sign_in/view.dart';
import 'package:flutter/material.dart';

class Routes {

  static const String signInPage = "/signInPage";
  static const String homePage = "/homePage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
     
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );

      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      default:
        return unDefinedRoute();
    }
  }


  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text("Page Not Found"),
        ),
      ),
    );
  }
}
