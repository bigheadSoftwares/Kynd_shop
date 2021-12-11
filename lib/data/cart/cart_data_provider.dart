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
      body: jsonEncode(<String, dynamic>{'id': productId, 'user_id': Constants.userId}),
      headers: <String, String>{
        'Authorization':
            Constants.token,
        'Content-Type': 'application/json'
      },
    );
    print(
        'This is response ${rawData.body} and this is status code ${rawData.statusCode}');
    if (rawData.statusCode == 200) {
      return true;
    } else {
      throw Exception(rawData);
    }
  }
}
