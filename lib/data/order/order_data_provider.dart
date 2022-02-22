import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/export_utilities.dart';
import '../../utils/functions/show.dart';

class OrderDataProvider {
  static Future<Response> orderList() async {
    final Response response = await get(
      Uri.parse(
        '${Constants.host}purchase-history/${Constants.authenticationModel?.success.customerId}',
      ),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  static Future<Response> orderDetail(int orderId) async {
    final Response response = await get(
      Uri.parse(
        '${Constants.host}purchase-history-items/$orderId',
      ),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  static Future<bool> createOrder(Map<String, dynamic> data) async {
    dynamic body = jsonEncode(data);
    show(body);
    final Response response = await post(
      Uri.parse('${Constants.host}order/store'),
      body: body,
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw response;
    }
  }
}
