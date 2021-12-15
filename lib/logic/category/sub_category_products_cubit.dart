import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/categories/sub_category_products_model/datum.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/categories/categories_repository.dart';
import '../../data/categories/sub_category_products_model/sub_category_products_model.dart';

part 'sub_category_products_state.dart';

class SubCategoryProductsCubit extends Cubit<SubCategoryProductsState> {
  SubCategoryProductsCubit() : super(SubCategoryProductsInitial());
  SubCategoryProductsModel subCategoryProductsModel =
      const SubCategoryProductsModel();
  void getSubCategoryProducts(int subCategoryId) {
    CategoryRepository.subCategoryProducts(subCategoryId).then(
      (SubCategoryProductsModel subCategoryProductsModel) {
        this.subCategoryProductsModel = subCategoryProductsModel;
        emit(
          SubCategoryProductsLoaded(subCategoryProductsModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          SubCategoryProductsFailure(
            handleError(error),
          ),
        );
      },
    );
  }

  void addProductToWishlist(int productId) {
    updateModel(productId, true);
    WishlistDataProvider.addToWishlist(productId).then((bool value) {
      if (!value) {
        updateModel(productId, false);
      }
    });
  }

  void removeProductFromWishlist(int productId) {
    updateModel(productId, false); //removing product from the model locally
    WishlistDataProvider.removeWishlist(productId).then((bool value) {
      if (!value) {
        updateModel(productId, true); //wishlist again on server failure
      }
    });
  }

  void updateModel(int productId, bool isAdd) {
    List<Datum>? data = subCategoryProductsModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      SubCategoryProductsLoaded(subCategoryProductsModel).copyWith(
        subCategoryProductsModel: subCategoryProductsModel.copyWith(data: data),
      ),
    );
    subCategoryProductsModel = subCategoryProductsModel.copyWith(data: data);
  }
}
