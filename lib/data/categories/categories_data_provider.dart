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
}
