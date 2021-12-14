part of 'add_to_cart_cubit.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartLoaded extends AddToCartState {}

class AddToCartFailure extends AddToCartState {
  const AddToCartFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}