part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => <Object>[];
}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryModel categoryModel;
  const CategoryLoaded(this.categoryModel);
  @override
  List<Object> get props => <Object>[categoryModel];
}

class CategoryFailure extends CategoryState {
  const CategoryFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
