import 'dart:convert';

import 'package:http/http.dart';
import 'my_addresses_model/my_addresses_model.dart';

import 'address_data_provider.dart';

class AddressRepository {
  ///Function to get my addresses [`MyAddressesModel`] of user
  static Future<MyAddressesModel> getAddresses() async {
    final Response _response = await AddressDataProvider.getAddresses();
    MyAddressesModel _addressesModel = MyAddressesModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _addressesModel;
  }
}
