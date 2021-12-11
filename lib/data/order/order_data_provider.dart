import 'package:http/http.dart';
import 'package:kynd_shop/utils/export_utilities.dart';

class OrderDataProvider {
  static Future<Response> orderList() async {
    final Response response = await get(
      Uri.parse(
        '${Constants.host}purchase-history-items/1',//TODO:make the customer id dynamic
      ),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
