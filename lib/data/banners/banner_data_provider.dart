part of 'banner_repository.dart';

class BannerDataProvider {
  static Future<Response> _getBanners() async {
    final Response response =
        await get(Uri.parse('${Constants.host}banners'));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
