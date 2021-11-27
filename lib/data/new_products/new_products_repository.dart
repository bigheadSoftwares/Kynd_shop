import 'dart:convert';

import 'package:http/http.dart';
import 'new_products_model.dart';
import '../../utils/constants/constants.dart';
part 'new_products_data_provider.dart';

class NewProductsRepository {
  ///Function to get what's new products [`NewProductsModel`] of home screen
  static Future<NewProductsModel> newProducts() async {
    final Response _response = await NewProductsDataProvider._getProducts();
    NewProductsModel _newProductsModel = NewProductsModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _newProductsModel;
  }
}
