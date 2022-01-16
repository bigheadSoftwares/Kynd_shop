part of 'combos_repository.dart';

class CombosDataProvider {
  static Future<Response> _getCombos() async {
    final Response response = await get(Uri.parse(
        '${Constants.host}products/combos/${Constants.authenticationModel?.success.customerId ?? 0}'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
