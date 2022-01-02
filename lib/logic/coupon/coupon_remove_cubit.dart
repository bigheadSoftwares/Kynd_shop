import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
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
