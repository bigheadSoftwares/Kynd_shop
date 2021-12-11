part of 'order_list_cubit.dart';

abstract class OrderListState extends Equatable {
  const OrderListState();

  @override
  List<Object> get props => <Object>[];
}

class OrderListInitial extends OrderListState {}

class OrderListLoaded extends OrderListState {
  final OrderListModel orderListModel;
  const OrderListLoaded(this.orderListModel);
  @override
  List<Object> get props => <Object>[orderListModel];
}

class OrderListFailure extends OrderListState {
  final Failure failure;
  const OrderListFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
