part of 'brands_repo.dart';

class _BrandsDataProvider {
  Future<Response> _fetchBrands() async {
    final Uri _url = Uri.parse('${Constants.host}brands');
    final Response response = await get(
      _url,
      headers: Constants.headers,
    );
    return response;
  }
}
