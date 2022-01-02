part of 'coupon_remove_cubit.dart';

abstract class CouponRemoveState extends Equatable {
  const CouponRemoveState();

  @override
  List<Object> get props => <Object>[];
}

class CouponRemoveInitial extends CouponRemoveState {}

class CouponRemoveLoading extends CouponRemoveState {}

class CouponRemoveSuccess extends CouponRemoveState {}

class CouponRemoveFailure extends CouponRemoveState {
  const CouponRemoveFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
