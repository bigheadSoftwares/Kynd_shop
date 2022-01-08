import 'dart:convert';

import 'package:http/http.dart';
import 'order_detail_model/order_detail_model.dart';
import 'order_data_provider.dart';
import 'order_list_model/order_list_model.dart';

class OrderRepository {
  ///Function to get orders list [`OrderListModel`]
  static Future<OrderListModel> orderListModel() async {
    final Response _response = await OrderDataProvider.orderList();
    OrderListModel _orderListModel = OrderListModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _orderListModel;
  }

  ///Function to get order detail [`OrderDetailModel`]
  static Future<OrderDetailModel> orderDetailModel(int orderId) async {
    final Response _response = await OrderDataProvider.orderDetail(orderId);
    OrderDetailModel _orderDetailModel =
        OrderDetailModel.fromJson(_response.body);
    return _orderDetailModel;
  }
}
