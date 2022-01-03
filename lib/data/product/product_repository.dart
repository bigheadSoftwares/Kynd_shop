import 'dart:convert';

import 'package:http/http.dart';
import 'package:kynd_shop/data/product/recommended_product_model/recommended_product_model.dart';
import '../../utils/functions/show.dart';
import 'search_product_model/search_product_model.dart';
import 'product_data_provider.dart';
import 'product_detail_model/product_detail_model.dart';

class ProductRepository {
  static Future<ProductDetailModel> getProductDetail(int productId) async {
    final Response _response =
        await ProductDataProvider.getProductDetail(productId);
    show('This is reponse ${_response.body} and ${_response.statusCode}');
    ProductDetailModel _productDetailModel = ProductDetailModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    show(_productDetailModel);
    return _productDetailModel;
  }

  static Future<SearchProductModel> searchProduct(String query) async {
    final Response _response = await ProductDataProvider.searchProduct(query);
    SearchProductModel _searchProductModel = SearchProductModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _searchProductModel;
  }
  static Future<RecommendedProductModel> recommendedProducts() async {
    final Response _response = await ProductDataProvider.getRecommendedProducts();
    RecommendedProductModel _recommendedProductModel = RecommendedProductModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _recommendedProductModel;
  }
}
