part of 'new_products_repository.dart';

class NewProductsDataProvider {
  static Future<Response> _getProducts() async {
    final Response response = await get(
      Uri.parse(
          '${Constants.host}products/whats-new/${Constants.authenticationModel?.success.customerId ?? 0}'),
      headers: Constants.headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }
}
