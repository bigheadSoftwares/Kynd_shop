part of 'sub_category_products_cubit.dart';

abstract class SubCategoryProductsState extends Equatable {
  const SubCategoryProductsState();

  @override
  List<Object> get props => <Object>[];
}

class SubCategoryProductsInitial extends SubCategoryProductsState {}

class SubCategoryProductsLoaded extends SubCategoryProductsState {
  final SubCategoryProductsModel subCategoryProductsModel;
  const SubCategoryProductsLoaded(this.subCategoryProductsModel);
  @override
  List<Object> get props => <Object>[subCategoryProductsModel];
}

class SubCategoryProductsFailure extends SubCategoryProductsState {
  final Failure failure;
  const SubCategoryProductsFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
