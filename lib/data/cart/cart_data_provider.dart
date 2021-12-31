import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class CartDataProvider {
  static Future<bool> addToCart(
      {required int productId, required int quantity}) async {
    final Response rawData = await post(Uri.parse('${Constants.host}carts/add'),
        body: jsonEncode(<String, dynamic>{
          'id': productId,
          'user_id': Constants.authenticationModel!.success.customerId,
          'quantity': quantity
        }),
        headers: Constants.headers);
    if (rawData.statusCode == 200) {
      return true;
    } else {
      throw Exception(rawData);
    }
  }

  static Future<Response> getCartDetails() async {
    final Response response = await get(
        Uri.parse(
            '${Constants.host}carts/${Constants.authenticationModel!.success.customerId}'),
        headers: Constants.headers);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<Response> getCartSummary() async {
    final Response response = await get(
        Uri.parse(
            '${Constants.host}cart-summary/${Constants.authenticationModel!.success.customerId}'),
        headers: Constants.headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<bool> cartChangeQuantity(
      {required int cartId, required int quantity}) async {
    final Response rawData = await post(
        Uri.parse('${Constants.host}carts/change-quantity'),
        body: jsonEncode(<String, dynamic>{'id': cartId, 'quantity': quantity}),
        headers: Constants.headers);
    if (rawData.statusCode == 200) {
      return true;
    } else {
      throw Exception(rawData);
    }
  }

  static Future<bool> cartDestroy(int cartId) async {
    final Response response = await get(
        Uri.parse('${Constants.host}cart/destroy/$cartId}'),
        headers: Constants.headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response);
    }
  }
}
