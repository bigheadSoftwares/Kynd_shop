part of 'best_sellers_repository.dart';

class BestSellersDataProvider {
  static Future<Response> _getBestSellers() async {
    final Response response = await get(
      Uri.parse('${Constants.host}products/best-seller/${Constants.userId}'),
      headers: <String, String>{
        HttpHeaders.authorizationHeader:
            Constants.authenticationModel!.success.token
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
