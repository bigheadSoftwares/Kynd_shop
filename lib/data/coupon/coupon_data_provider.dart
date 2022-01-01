import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/constants/constants.dart';

class CouponDataProvider {
  static Future<Response> getCouponsList() async {
    final Response response = await get(
        Uri.parse('${Constants.host}coupon/list'),
        headers: Constants.headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<bool> applyCoupon(String couponCode) async {
    final String body = jsonEncode(<String, dynamic>{
      'coupon_code': couponCode,
      'user_id': Constants.authenticationModel!.success.customerId
    });
    final Response response = await post(
      Uri.parse('${Constants.host}coupon/apply'),
      body: body,
      headers: Constants.headers,
    );
    dynamic data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['result'] == true) {
      return true;
    } else {
      throw Exception(response);
    }
  }

  static Future<bool> removeCoupon() async {
    final String body = jsonEncode(<String, dynamic>{
      'user_id': Constants.authenticationModel!.success.customerId
    });
    final Response response = await post(
      Uri.parse('${Constants.host}coupon/remove'),
      body: body,
      headers: Constants.headers,
    );
    dynamic data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['result'] == true) {
      return true;
    } else {
      throw Exception(response);
    }
  }
}
