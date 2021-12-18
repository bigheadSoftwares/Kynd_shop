import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/coupon/coupon_repository.dart';
import '../../data/coupon/coupn_model/coupn_model.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit() : super(CouponInitial());

  void getCoupnList() {
    CouponRepository.getCouponList().then(
      (CoupnModel coupnModel) {
        emit(
          CouponLoaded(coupnModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        print(error);
        emit(
          CouponFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
