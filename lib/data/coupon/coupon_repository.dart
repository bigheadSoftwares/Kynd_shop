import 'package:http/http.dart';
import 'coupon_data_provider.dart';

import 'coupon_model/coupon_model.dart';

class CouponRepository {
  static Future<CouponModel> getCouponList() async {
    final Response _response = await CouponDataProvider.getCouponsList();
    CouponModel _couponModel = CouponModel.fromJson(_response.body);
    return _couponModel;
  }
}
