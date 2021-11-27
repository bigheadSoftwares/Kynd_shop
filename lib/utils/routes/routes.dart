import 'package:flutter/material.dart';
import 'package:kynd_shop/view/introduction_screens/introduction_screens.dart';
import '../../view/filters/filter.dart';
import '../../view/payment/payment.dart';
import '../../view/payment/payment_successful.dart';
import '../../view/cart/cart.dart';
import '../../view/discussion/discussion.dart';
import '../../view/about_us/about_us.dart';
import '../../view/terms_and_condition/terms_and_condition.dart';
import '../../view/product_detail/product_detail.dart';
import '../../view/search/search.dart';
import '../../view/wishlist/wishlist.dart';
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
  static const String orderDetail = '/order-detail';
  static const String pointEarned = '/point-earned';
  static const String termsAndCondition = '/termsAndCondition';
  static const String aboutUs = '/aboutUs';
  static const String discussion = '/discussion';
  static const String discussionDetails = '/discussion-details';
  static const String startDiscussion = '/start-discussion';
  static const String wishlist = '/wishlist';
  static const String search = '/search';
  static const String productDetail = '/productDetail';
  static const String cart = '/cart';
  static const String payment = '/payment';
  static const String paymentSuccessful = '/paymentSuccessful';
  static const String introScreens = '/introScreen';
  static const String filter = '/filter';

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
      case orderDetail:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OrderDetail(),
        );
      case pointEarned:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PointEarned(),
        );
      case termsAndCondition:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const TermsAndCondition(),
        );
      case aboutUs:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AboutUs(),
        );
      case discussion:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Discussion(),
        );
      case discussionDetails:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const DiscussionDetails(),
        );
      case startDiscussion:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const StartDiscussion(),
        );
      case wishlist:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Wishlist(),
        );
      case search:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Search(),
        );
      case productDetail:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ProductDetail(),
        );
      case cart:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Cart(),
        );
      case payment:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Payment(),
        );
      case paymentSuccessful:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const PaymentSuccessful(),
        );
      case introScreens:
        return MaterialPageRoute<dynamic>(builder: (_) => const IntroScreens());
      case filter:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Filter(),
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
