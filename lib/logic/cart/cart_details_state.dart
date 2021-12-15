part of 'cart_details_cubit.dart';

abstract class CartDetailsState extends Equatable {
  const CartDetailsState();

  @override
  List<Object> get props => <Object>[];
}

class CartDetailsInitial extends CartDetailsState {}

class CartDetailsLoaded extends CartDetailsState {
  const CartDetailsLoaded(this.cartDetaiilsModel);
  final CartDetaiilsModel cartDetaiilsModel;
  @override
  List<Object> get props => <Object>[cartDetaiilsModel];
}

class CartDetailsFailure extends CartDetailsState {
  const CartDetailsFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
