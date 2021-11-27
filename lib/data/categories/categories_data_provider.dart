part of 'categories_repository.dart';

class CategoryDataProvider {
  static Future<Response> _getCategories() async {
    print('provider got called');

    final Response response =
        await get(Uri.parse('${Constants.host}categories'));
    print('this is the response $response');
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
