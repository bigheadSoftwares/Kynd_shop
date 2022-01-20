import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../data/coupon/coupon_data_provider.dart';

part 'coupon_remove_state.dart';

class CouponRemoveCubit extends Cubit<CouponRemoveState> {
  CouponRemoveCubit() : super(CouponRemoveInitial());

  void removeCoupon() {
    emit(CouponRemoveLoading());
    CouponDataProvider.removeCoupon().then(
      (bool response) {
        emit(
          CouponRemoveSuccess(),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          CouponRemoveFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
