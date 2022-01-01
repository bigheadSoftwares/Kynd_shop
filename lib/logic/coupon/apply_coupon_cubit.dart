import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/coupon/coupon_data_provider.dart';

part 'apply_coupon_state.dart';

class ApplyCouponCubit extends Cubit<ApplyCouponState> {
  ApplyCouponCubit() : super(ApplyCouponInitial());

  void applyCoupon(String couponCode) {
    CouponDataProvider.applyCoupon(couponCode).then(
      (bool response) {
        emit(
          ApplyCouponSuccess(couponCode),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          ApplyCouponFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
