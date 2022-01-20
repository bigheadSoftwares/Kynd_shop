import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/functions/show.dart';
import '../models/add_address_model.dart';
import '../../utils/export_utilities.dart';

class AddressDataProvider {
  static Future<Response> getAddresses() async {
    final Response response = await get(
      Uri.parse(
          '${Constants.host}user/shipping/address/${Constants.authenticationModel?.success.customerId ?? 0}'),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<bool> createAddress(AddAddressModel data) async {
    show(data);
    final Response response = await post(
      Uri.parse('${Constants.host}user/shipping/create'),
      body: data.toJson(),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response);
    }
  }

  static Future<bool> makeDefault(int addressId) async {
    dynamic body = jsonEncode(<String, dynamic>{
      'user_id': Constants.authenticationModel!.success.customerId,
      'id': addressId
    });
    final Response response = await post(
      Uri.parse('${Constants.host}user/shipping/makedefault'),
      body: body,
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response);
    }
  }
}
