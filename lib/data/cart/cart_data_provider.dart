import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class CartDataProvider {
  static Future<bool> addToCart({
    required int productId,
  }) async {
    final Response rawData = await post(
      Uri.parse('${Constants.host}carts/add'),
      body: jsonEncode(
          <String, dynamic>{'id': productId, 'user_id': Constants.authenticationModel!.success.customerId}),
      headers: <String, String>{
        'Authorization': Constants.authenticationModel!.success.token,
        'Content-Type': 'application/json'
      },
    );

    if (rawData.statusCode == 200) {
      return true;
    } else {
      throw Exception(rawData);
    }
  }

  static Future<Response> getCartDetails() async {
    final Response response = await get(
      Uri.parse('${Constants.host}carts/${Constants.authenticationModel!.success.customerId}'),
      headers: <String, String>{
        'Authorization': Constants.authenticationModel!.success.token,
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<Response> getCartSummary() async {
    print('This is ${Constants.userId} and this is token');
    final Response response = await get(
      Uri.parse('${Constants.host}cart-summary/${Constants.authenticationModel!.success.customerId}'),
      headers: <String, String>{
        'Authorization': Constants.authenticationModel!.success.token,
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
