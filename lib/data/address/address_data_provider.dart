import 'package:http/http.dart';
import '../../utils/export_utilities.dart';

class AddressDataProvider {
  static Future<Response> getAddresses() async {
    final Response response = await get(
      Uri.parse(
          '${Constants.host}user/shipping/address/${Constants.authenticationModel!.success.customerId}'),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
