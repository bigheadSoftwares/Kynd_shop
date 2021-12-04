import 'dart:convert';

import 'package:easy_coding/handle_error.dart';
import 'package:http/http.dart';
import '../../utils/constants/constants.dart';

part 'brands_model.dart';
part 'brands.dart';

class BrandsRepository extends _BrandsDataProvider {
  Future<BrandsModel> fetchBrands() async {
    final Response response = await _fetchBrands();

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw handleError(response);
    }

    try {
      return brandsModelFromJson(response.body);
    } catch (_) {
      throw const Failure(
        message: 'Something went wrong in data parsing of brands',
      );
    }
  }
}
