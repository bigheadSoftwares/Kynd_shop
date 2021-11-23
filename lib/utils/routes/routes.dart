import 'package:flutter/material.dart';
import '../../view/category/category_tabs.dart';
import '../../view/home/home.dart';
import '../../view/profile/profile.dart';
import '../../view/orders/my_orders.dart';
import '../../view/authenticationScreens/register_screen.dart';
import '../../view/authenticationScreens/login_screen.dart';
import '../../view/authenticationScreens/age_confirmation_screen.dart';
import '../../view/splashScreen/splash_screen.dart';

class Routes {
  static const String introScreen = '/';
  static const String ageConfirmationScreen = '/ageConfirmation';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String home = '/home';
  static const String category = '/category';
  static const String myOrders = '/myOrders';
  static const String profile = '/profile';

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
          builder: (_) => RegisterScreen(),
        );
      case home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
        );
      case category:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const CategoryTabs(),
        );
      case myOrders:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MyOrders(),
        );
      case profile:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Profile(),
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
