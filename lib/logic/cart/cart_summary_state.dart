part of 'cart_summary_cubit.dart';

abstract class CartSummaryState extends Equatable {
  const CartSummaryState();

  @override
  List<Object> get props => <Object>[];
}

class CartSummaryInitial extends CartSummaryState {}

class CartSummaryLoading extends CartSummaryState {}

class CartSummaryLoaded extends CartSummaryState {
  const CartSummaryLoaded(this.cartSummaryModel);
  final CartSummaryModel cartSummaryModel;
  @override
  List<Object> get props => <Object>[cartSummaryModel];
}

class CartSummaryFailure extends CartSummaryState {
  const CartSummaryFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
