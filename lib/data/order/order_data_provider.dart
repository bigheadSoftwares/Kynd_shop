import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class OrderDataProvider {
  static Future<Response> orderList() async {
    final Response response = await get(
      Uri.parse(
        '${Constants.host}purchase-history/1', //TODO:make the customer id dynamic
      ),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
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
      throw Exception(response);
    }
  }
}
