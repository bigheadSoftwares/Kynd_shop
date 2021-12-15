import 'dart:convert';

import 'package:http/http.dart';
import 'sub_category_products_model/sub_category_products_model.dart';
import '../../utils/constants/constants.dart';
import 'category_model/category_model.dart';
import 'sub_category_model/sub_category_model.dart';
part 'categories_data_provider.dart';

class CategoryRepository {
  ///Function to get the categories [`CategoryModel`] of the drinks
  static Future<CategoryModel> drinkCategories() async {
    final Response _response = await CategoryDataProvider._getCategories();
    CategoryModel _categoryModel = CategoryModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _categoryModel;
  }

  ///Function to get the sub categories [`SubCategoryModel`] of the category
  static Future<SubCategoryModel> subCategories(int categoryId) async {
    final Response _response =
        await CategoryDataProvider._getSubCategories(categoryId);
    SubCategoryModel _subCategoryModel = SubCategoryModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>);
    return _subCategoryModel;
  }

  ///Function to get the sub categories products [`SubCategoryProductsModel`] of the category
  static Future<SubCategoryProductsModel> subCategoryProducts(
      int subCategoryId) async {
    final Response _response =
        await CategoryDataProvider._getSubCategoryProducts(subCategoryId);
    SubCategoryProductsModel _subCategoryProductsModel =
        SubCategoryProductsModel.fromJson(
            jsonDecode(_response.body) as Map<String, dynamic>);
    return _subCategoryProductsModel;
  }
}
