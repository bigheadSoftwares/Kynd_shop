import 'dart:convert';

import 'package:http/http.dart';
import '../../utils/constants/constants.dart';
import 'category_model/category_model.dart';
part 'categories_data_provider.dart';

class CategoryRepository {
  ///Function to get the categories [`CategoryModel`] of the drinks
  static Future<CategoryModel> drinkCategories() async {
    print('repo got called');

    final Response _response = await CategoryDataProvider._getCategories();
    CategoryModel _categoryModel = CategoryModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _categoryModel;
  }
}
