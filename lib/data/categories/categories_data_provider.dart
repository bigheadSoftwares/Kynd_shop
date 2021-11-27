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
}
