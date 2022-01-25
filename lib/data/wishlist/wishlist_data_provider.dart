import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/functions/show.dart';
import '../../utils/export_utilities.dart';

class WishlistDataProvider {
  static Future<bool> addToWishlist(int productId) async {
    final String body = jsonEncode(<String, dynamic>{
      'product_id': productId,
      'user_id': Constants.authenticationModel?.success.customerId
    });
    final Response response = await post(
      Uri.parse('${Constants.host}wishlists-add-product'),
      body: body,
      headers: Constants.headers,
    );
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['is_in_wishlist'] == true) {
      return true;
    } else {
      throw response;
    }
  }

  static Future<bool> removeWishlist(int productId) async {
    final String body = jsonEncode(<String, dynamic>{
      'product_id': productId,
      'user_id': Constants.authenticationModel?.success.customerId
    });
    final Response response = await post(
      Uri.parse('${Constants.host}wishlists-removeproduct'),
      body: body,
      headers: Constants.headers,
    );
    show('this is the id $productId and wishlist response ${response.body}');
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['is_in_wishlist'] == false) {
      return true;
    } else {
      throw response;
    }
  }

  static Future<Response> getWishlist() async {
    final Response response = await get(
      Uri.parse(
          '${Constants.host}wishlists/${Constants.authenticationModel?.success.customerId}'),
      headers: Constants.headers,
    );
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['success'] == true) {
      return response;
    } else {
      throw response;
    }
  }
}
