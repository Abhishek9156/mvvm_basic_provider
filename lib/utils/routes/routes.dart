import 'package:flutter/material.dart';
import 'package:mvvm_basic/utils/routes/routes_name.dart';
import 'package:mvvm_basic/view/home_screen.dart';
import 'package:mvvm_basic/view/login_view.dart';
import 'package:mvvm_basic/view/signup_view.dart';
import 'package:mvvm_basic/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView(),);
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView(),);


      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text("No route defined")),
          );
        });
    }
  }
}
