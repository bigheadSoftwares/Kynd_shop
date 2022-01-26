import '../export_utilities.dart';

void showLoginToast() {
  showToast('Please login first');
  Constants.navigatorKey.currentState!.pushNamedAndRemoveUntil(
    Routes.loginScreen,
    (dynamic route) => false,
  );
}
