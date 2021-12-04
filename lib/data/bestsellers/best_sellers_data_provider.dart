part of 'best_sellers_repository.dart';

class BestSellersDataProvider {
  static Future<Response> _getBestSellers() async {
    final Response response = await post(
      Uri.parse('${Constants.host}products/best-seller'),
      body: jsonEncode(
        <String, dynamic>{
          'customer_id': 2,
        },
      ),
      headers: <String, String>{
        HttpHeaders.authorizationHeader:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjAyNDE5Yjc2ZTBkNjVkNjg2YzUzZTFiYTExNmU3YWJkZTBiMjNlMzcxNTg5MWViZGQ0ODJiN2NiM2JhNjU1N2Y0NGFkY2I4NzU3ZjczZjg0In0.eyJhdWQiOiIxIiwianRpIjoiMDI0MTliNzZlMGQ2NWQ2ODZjNTNlMWJhMTE2ZTdhYmRlMGIyM2UzNzE1ODkxZWJkZDQ4MmI3Y2IzYmE2NTU3ZjQ0YWRjYjg3NTdmNzNmODQiLCJpYXQiOjE2MzgwNDAzMTIsIm5iZiI6MTYzODA0MDMxMiwiZXhwIjoxNjY5NTc2MzEyLCJzdWIiOiIxMiIsInNjb3BlcyI6W119.kj4K-zZPkP61w4Oq_BM-cKzGz4c-MEc9QJz-E4Vh1EMt5sDIP_v9OHxxpQB4R7fpEyvArK_U3wS5PAuSZr1kPRkERy5-RO5-QhBmQtMIHWOhIdOCwkSY3sagSj2JAtBzspHUmkqepJcLTpObAasPwRFXHPed_DAq8_wIJlrSohUaCNfwTPgWhqppPkTtPbiplw_Aw_OVSBSFsHBSLEClSy6DGqiIiC4ijtUNFVThOGaLl_1tzNBx_HhZFmUBCFoxp0HKPzZgD9Gqpx0SBdgWGE_mtGKk8kGFga-IoJW6z7MjX5W4K1P2xkkJ2M8WcyymBTRiLHO-2r6lmL3YhINYCJn8oU73_BVflPRgcdObast2u1_1qTH82aYx58nmhC9oC7HtMO_GHyu9DwQhT4McbH8XFjafd09xN-kZoQqVHXXTugO0VihvKhWSdai4PCs_t5Tg_kAzR8x_QK48bHKlykfvaGwebvw1p2gh1hp3Bfk7jEjnviszph_gBMFrCqAGqu-j30RgjSJ8i2KejnyE5gU1On17cHUEFHyaaLST214GPMooZ9VwAfpiMKkMCRrqHhK9_xOWAoOCDz3CPd01dE7Fx6Hrw4xlNZcElTPrAwX3uEAFyaAhUDN9s2eDYEuvuxg1tkJOCiCU6H29Yj9gd0n7AVcBW9sEbOrZMRysl0s',
      },
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response);
    }
  }
}
