part of 'categories_repository.dart';

class CategoryDataProvider {
  static Future<Response> _getCategories() async {
    final Response response =
        await get(Uri.parse('${Constants.host}categories'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<Response> _getSubCategories(int categoryId) async {
    final Response response =
        await get(Uri.parse('${Constants.host}sub-categories/$categoryId'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }

  static Future<Response> _getSubCategoryProducts({
    int? subCategoryId,
    SelectedFilterModel? selectedFilterModel,
  }) async {
    Map<String, dynamic> body = <String, dynamic>{
      'customer_id': Constants.authenticationModel!.success.customerId,
    };
    if (subCategoryId != null) {
      body.addAll(<String, dynamic>{
        'categories': subCategoryId,
      });
    }
    if (selectedFilterModel != null) {
      body.addAll(<String, dynamic>{
        'sort_key': selectedFilterModel.sortBy == SortByEnum.none
            ? 'price_low_to_high'
            : describeEnum(selectedFilterModel.sortBy),
        'min': selectedFilterModel.priceRange.start,
        'max': selectedFilterModel.priceRange.end,
      });
      if (selectedFilterModel.brandSet.isNotEmpty) {
        StringBuffer stringBuffer = StringBuffer();
        stringBuffer.writeAll(selectedFilterModel.brandSet.toList(), ',');
        body.addAll(<String, dynamic>{
          'brands': stringBuffer.toString(),
        });
      }
    }
    final Response response = await post(
      Uri.parse(
        '${Constants.host}products/search',
      ),
      body: jsonEncode(body),
      headers: <String, String>{
        'Authorization': Constants.authenticationModel?.success.token ?? '',
        'Content-Type': 'application/json'
      },
    );
    show(
        'requesting subcategories body -> $body --- response -> ${response.statusCode}');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
