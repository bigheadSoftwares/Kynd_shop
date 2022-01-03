part of 'apply_coupon_cubit.dart';

abstract class ApplyCouponState extends Equatable {
  const ApplyCouponState();

  @override
  List<Object> get props => <Object>[];
}

class ApplyCouponInitial extends ApplyCouponState {}

class ApplyCouponSuccess extends ApplyCouponState {
  final String couponCode;

  const ApplyCouponSuccess(this.couponCode);
  @override
  List<Object> get props => <Object>[couponCode];
}

class ApplyCouponFailure extends ApplyCouponState {
  const ApplyCouponFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
