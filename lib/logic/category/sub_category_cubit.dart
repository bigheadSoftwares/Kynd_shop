import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../utils/export_utilities.dart';
import '../../data/categories/categories_repository.dart';
import '../../data/categories/sub_category_model/sub_category_model.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit() : super(SubCategoryInitial());
  void getSubCategory(int categoryId) {
    emit(SubCategoryInitial());
    CategoryRepository.subCategories(categoryId).then(
      (SubCategoryModel subCategoryModel) => emit(
        SubCategoryLoaded(subCategoryModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          SubCategoryFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
