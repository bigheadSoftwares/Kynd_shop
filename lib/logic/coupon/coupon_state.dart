part of 'coupon_cubit.dart';

abstract class CouponState extends Equatable {
  const CouponState();

  @override
  List<Object> get props => [];
}

class CouponInitial extends CouponState {}

class CouponLoaded extends CouponState {
  const CouponLoaded(this.coupnModel);
  final CouponModel coupnModel;
  @override
  List<Object> get props => <Object>[coupnModel];

  CouponLoaded copyWith({
    CouponModel? coupnModel,
  }) {
    return CouponLoaded(
      coupnModel ?? this.coupnModel,
    );
  }
}

class CouponFailure extends CouponState {
  const CouponFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
