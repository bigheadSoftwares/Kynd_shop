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
          <String, dynamic>{'id': productId, 'user_id': Constants.userId}),
      headers: <String, String>{
        'Authorization': Constants.token,
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
        Uri.parse('${Constants.host}carts/${Constants.userId}'),
        headers: Constants.headers);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<Response> getCartSummary() async {
    final Response response = await get(
        Uri.parse('${Constants.host}cart-summary/${Constants.userId}'),
        headers: Constants.headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
