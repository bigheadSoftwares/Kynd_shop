import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../data/categories/categories_repository.dart';
import '../../data/categories/category_model/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  void getDrinkCategories() {
    CategoryRepository.drinkCategories().then(
      (CategoryModel categoryModel) => emit(
        CategoryLoaded(categoryModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          CategoryFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
