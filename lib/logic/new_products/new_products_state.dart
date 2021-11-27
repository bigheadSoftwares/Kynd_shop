part of 'new_products_cubit.dart';

abstract class NewProductsState extends Equatable {
  const NewProductsState();

  @override
  List<Object> get props => <Object>[];
}

class NewProductsInitial extends NewProductsState {}

class NewProductsLoaded extends NewProductsState {
  const NewProductsLoaded(this.newProductsModel);
  final NewProductsModel newProductsModel;
  @override
  List<Object> get props => <Object>[newProductsModel];
}

class NewProductsFailure extends NewProductsState {
  const NewProductsFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
