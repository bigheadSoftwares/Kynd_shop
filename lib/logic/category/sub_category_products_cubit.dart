import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/categories/categories_repository.dart';
import '../../data/categories/sub_category_products_model/sub_category_products_model.dart';

part 'sub_category_products_state.dart';

class SubCategoryProductsCubit extends Cubit<SubCategoryProductsState> {
  SubCategoryProductsCubit() : super(SubCategoryProductsInitial());
  void getSubCategoryProducts(int subCategoryId) {
    CategoryRepository.subCategoryProducts(subCategoryId).then(
      (SubCategoryProductsModel subCategoryProductsModel) => emit(
        SubCategoryProductsLoaded(subCategoryProductsModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          SubCategoryProductsFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
