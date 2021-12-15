import 'package:http/http.dart';
import 'cart_summary_model.dart';
import 'cart_data_provider.dart';
import 'cart_detaiils_model/cart_detaiils_model.dart';

class CartRepository {
  static Future<CartDetaiilsModel> getCartDetails() async {
    final Response _response = await CartDataProvider.getCartDetails();
    CartDetaiilsModel _cartDetailModel =
        CartDetaiilsModel.fromJson(_response.body);
    return _cartDetailModel;
  }

  static Future<CartSummaryModel> getCartSummary() async {
    final Response _response = await CartDataProvider.getCartSummary();
    CartSummaryModel _cartSummaryModel =
        CartSummaryModel.fromJson(_response.body);
    return _cartSummaryModel;
  }
}
