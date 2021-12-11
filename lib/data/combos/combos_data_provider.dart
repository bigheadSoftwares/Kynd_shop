part of 'combos_repository.dart';

class CombosDataProvider {
  static Future<Response> _getCombos() async {
    final Response response = await get(
        Uri.parse('${Constants.host}products/combos/${Constants.userId}'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
