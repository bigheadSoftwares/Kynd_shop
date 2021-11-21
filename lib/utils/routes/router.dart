import 'package:flutter/material.dart';
import '../../view/authenticationScreens/register_screen.dart';
import '../../view/authenticationScreens/login_screen.dart';
import '../../view/authenticationScreens/age_confirmation_screen.dart';
import '../../view/splashScreen/splash_screen.dart';

part 'routes.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashScreen(),
        );
      case ageConfirmationScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AgeConfirmationScreen(),
        );
      case loginScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LoginScreen(),
        );
      case registerScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) =>  RegisterScreen(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
