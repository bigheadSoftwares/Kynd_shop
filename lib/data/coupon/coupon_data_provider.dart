import 'package:http/http.dart';
import '../../utils/constants/constants.dart';

class CouponDataProvider {
  static Future<Response> getCouponsList() async {
    final Response response = await get(
        Uri.parse('${Constants.host}coupon/list}'),
        headers: Constants.headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
