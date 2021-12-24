import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class ProductDataProvider {
  static Future<Response> getProductDetail(int productId) async {
    final String body = jsonEncode(<String, dynamic>{
      'product_id': productId,
      'customer_id': Constants.authenticationModel!.success.customerId,
    });
    final Response response = await post(
      Uri.parse('${Constants.host}product'),
      body: body,
      headers: <String, String>{
        'Authorization':
            'Bearer ${Constants.authenticationModel!.success.token}',
        'Content-Type': 'application/json'
      },
    );
    print(
        "This is body ${response.body} and this is status code ${response.statusCode}");
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['success'] == true) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
