part of 'sub_category_cubit.dart';

abstract class SubCategoryState extends Equatable {
  const SubCategoryState();

  @override
  List<Object> get props => <Object>[];
}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoaded extends SubCategoryState {
  final SubCategoryModel subCategoryModel;
  const SubCategoryLoaded(this.subCategoryModel);
  @override
  List<Object> get props => <Object>[subCategoryModel];
}

class SubCategoryFailure extends SubCategoryState {
  final Failure failure;
  const SubCategoryFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
