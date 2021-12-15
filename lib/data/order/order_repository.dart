import 'dart:convert';

import 'package:http/http.dart';
import 'order_data_provider.dart';
import 'order_list_model/order_list_model.dart';

class OrderRepository {
  ///Function to get orders list [`OrderListModel`] of home screen
  static Future<OrderListModel> orderListModel() async {
    final Response _response = await OrderDataProvider.orderList();
    OrderListModel _orderListModel = OrderListModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _orderListModel;
  }
}
