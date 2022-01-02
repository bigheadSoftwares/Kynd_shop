import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../data/coupon/coupon_model/coupon_model.dart';
import '../../data/coupon/coupon_repository.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit() : super(CouponInitial());
  final TextEditingController controller = TextEditingController();

  void getCoupnList() {
    CouponRepository.getCouponList().then(
      (CouponModel coupnModel) {
        emit(
          CouponLoaded(coupnModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          CouponFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
