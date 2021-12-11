import 'dart:convert';

import 'package:http/http.dart';
import 'package:kynd_shop/data/product/product_data_provider.dart';
import 'package:kynd_shop/data/product/product_detail_model/product_detail_model.dart';

class ProductRepository {
  static Future<ProductDetailModel> getProductDetail(int productId) async {
    final Response _response =
        await ProductDataProvider.getProductDetail(productId);
    ProductDetailModel _productDetailModel = ProductDetailModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _productDetailModel;
  }
}
