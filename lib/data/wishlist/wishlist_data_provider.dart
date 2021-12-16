import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class WishlistDataProvider {
  static Future<bool> addToWishlist(int productId) async {
    final String body = jsonEncode(<String, dynamic>{
      'product_id': productId,
      'user_id': 1 //TODO: make it dynamic
    });
    final Response response = await post(
        Uri.parse('${Constants.host}wishlists-add-product'),
        body: body,
        headers: Constants.headers);
    print(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['is_in_wishlist'] == true) {
      return true;
    } else {
      throw Exception(response);
    }
  }

  static Future<bool> removeWishlist(int productId) async {
    final String body = jsonEncode(<String, dynamic>{
      'product_id': productId,
      'user_id': 1 //TODO: make it dynamic
    });
    final Response response = await post(
        Uri.parse('${Constants.host}wishlists-removeproduct'),
        body: body,
        headers: Constants.headers);
    print(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['is_in_wishlist'] == false) {
      return true;
    } else {
      throw Exception(response);
    }
  }

  static Future<Response> getWishlist() async {
    final Response response = await get(
      Uri.parse('${Constants.host}wishlists/1'), //TODO: make userId dynamic
      headers: <String, String>{
        'Authorization':
            Constants.authenticationModel!.success.token,
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['success'] == true) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
