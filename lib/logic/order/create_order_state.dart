part of 'create_order_cubit.dart';

abstract class CreateOrderState extends Equatable {
  const CreateOrderState();

  @override
  List<Object> get props => <Object>[];
}

class CreateOrderInitial extends CreateOrderState {}

class CreateOrderLoading extends CreateOrderState {}

class CreateOrderLoaded extends CreateOrderState {}

class CreateOrderFailure extends CreateOrderState {
  final Failure failure;

  const CreateOrderFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
