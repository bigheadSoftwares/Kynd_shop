import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../utils/export_utilities.dart';
import '../../utils/functions/show.dart';

class ProductDataProvider {
  static Future<Response> getProductDetail(int productId) async {
    final String body = jsonEncode(<String, dynamic>{
      'product_id': productId,
      'customer_id': Constants.authenticationModel?.success.customerId ?? 0,
    });
    final Response response = await post(
      Uri.parse('${Constants.host}product'),
      body: body,
      headers: <String, String>{
        // HttpHeaders.authorizationHeader: '',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  static Future<Response> searchProduct(String query) async {
    final String body = jsonEncode(<String, dynamic>{
      'name': query,
      'customer_id': Constants.authenticationModel?.success.customerId
    });
    final Response response = await post(
      Uri.parse('${Constants.host}products/search'),
      body: body,
      headers: Constants.headers,
    );
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['success'] == true) {
      return response;
    } else {
      throw response;
    }
  }

  static Future<Response> getRecommendedProducts() async {
    final String body = jsonEncode(<String, dynamic>{
      'customer_id': Constants.authenticationModel?.success.customerId,
    });
    final Response response = await post(
      Uri.parse('${Constants.host}recommend'),
      body: body,
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
