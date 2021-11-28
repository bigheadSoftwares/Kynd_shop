import 'dart:convert';

import 'package:http/http.dart';
import 'banner_model.dart';

import '../../utils/constants/constants.dart';
part 'banner_data_provider.dart';

class BannerRepository {
  static Future<BannerModel> getBanner() async {
    final Response _response = await BannerDataProvider._getBanners();
    BannerModel _bestSellersModel = BannerModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _bestSellersModel;
  }
}
