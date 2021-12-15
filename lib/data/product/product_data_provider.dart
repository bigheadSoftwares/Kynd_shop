import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class ProductDataProvider {
  static Future<Response> getProductDetail(int productId) async {
    final Response response = await get(
      Uri.parse('${Constants.host}product/$productId'),
      headers: <String, String>{
        'Authorization': Constants.authenticationModel!.success.token,
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
