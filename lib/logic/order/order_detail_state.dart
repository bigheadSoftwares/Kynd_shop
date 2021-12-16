part of 'order_detail_cubit.dart';

abstract class OrderDetailState extends Equatable {
  const OrderDetailState();

  @override
  List<Object> get props => <Object>[];
}

class OrderDetailInitial extends OrderDetailState {}

class OrderDetailLoaded extends OrderDetailState {
  final OrderDetailModel orderDetailModel;

  const OrderDetailLoaded(this.orderDetailModel);
  @override
  List<Object> get props => <Object>[orderDetailModel];
}

class OrderDetailFailure extends OrderDetailState {
  final Failure failure;

  const OrderDetailFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
