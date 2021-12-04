import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'best_sellers_model.dart';
import '../../utils/constants/constants.dart';
part 'best_sellers_data_provider.dart';

class BestSellersRepository {
  ///Function to get best sellers products [`BestSellersModel`] of home screen
  static Future<BestSellersModel> newProducts() async {
    print('This is called');
    final Response _response = await BestSellersDataProvider._getBestSellers();
    BestSellersModel _bestSellersModel = BestSellersModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    print('This is best seller model $_bestSellersModel');
    return _bestSellersModel;
  }
}
