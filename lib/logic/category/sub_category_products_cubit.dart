import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../utils/functions/show.dart';
import '../../data/cart/cart_data_provider.dart';
import '../../data/filter/selected_filter.dart';
import '../../data/categories/sub_category_products_model/datum.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/categories/categories_repository.dart';
import '../../data/categories/sub_category_products_model/sub_category_products_model.dart';

part 'sub_category_products_state.dart';

class SubCategoryProductsCubit extends Cubit<SubCategoryProductsState> {
  SubCategoryProductsCubit() : super(SubCategoryProductsInitial());
  SubCategoryProductsModel subCategoryProductsModel =
      const SubCategoryProductsModel();
  void getSubCategoryProducts({
    int? subCategoryId,
    SelectedFilterModel? selectedFilterModel,
  }) {
    emit(SubCategoryProductsInitial());
    CategoryRepository.subCategoryProducts(
      subCategoryId: subCategoryId,
      selectedFilterModel: selectedFilterModel,
    ).then(
      (SubCategoryProductsModel subCategoryProductsModel) {
        this.subCategoryProductsModel = subCategoryProductsModel;
        emit(
          SubCategoryProductsLoaded(subCategoryProductsModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        show('Error SubCategoryProductsCubit -> $error');
        show('Stack SubCategoryProductsCubit -> $stack');
        emit(
          SubCategoryProductsFailure(
            handleError(error),
          ),
        );
      },
    );
  }

  void addProductToCart(int productId, int quantity) {
    updateCartModel(productId, true, quantity);
    CartDataProvider.addToCart(productId: productId, quantity: quantity + 1)
        .then((bool value) {
      if (!value) {
        updateCartModel(productId, false, quantity);
      }
    });
  }

  void removeProductFromCart(int productId, int quantity) {
    updateCartModel(
        productId, false, quantity); //removing product from the model locally
    CartDataProvider.addToCart(productId: productId, quantity: quantity - 1)
        .then((bool value) {
      if (!value) {
        updateCartModel(
            productId, true, quantity); //wishlist again on server failure
      }
    });
  }

  void updateCartModel(int productId, bool isAdd, int quanitity) {
    List<Datum>? data = subCategoryProductsModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(
            cartQuantity: isAdd ? quanitity + 1 : quanitity - 1,
            isAddedToCart: 1);
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
