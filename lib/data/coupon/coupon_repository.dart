import 'package:http/http.dart';
import 'package:kynd_shop/data/coupon/coupn_model/coupn_model.dart';
import 'package:kynd_shop/data/coupon/coupon_data_provider.dart';

class CouponRepository {
  static Future<CoupnModel> getCouponList() async {
    final Response _response = await CouponDataProvider.getCouponsList();
    CoupnModel _couponModel = CoupnModel.fromJson(_response.body);
    return _couponModel;
  }
}
