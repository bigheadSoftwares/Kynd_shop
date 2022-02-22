import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/cart/cart_data_provider.dart';
import '../../utils/export_utilities.dart';
import '../../data/product/search_product_model/datum.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../utils/functions/show.dart';
import '../../data/product/product_repository.dart';
import '../../data/product/search_product_model/search_product_model.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit() : super(SearchProductInitial());
  SearchProductModel searchProductModel = const SearchProductModel();
  void searchProduct(String query) {
    // emit(SearchProductInitial());
    ProductRepository.searchProduct(query).then(
        (SearchProductModel searchProductModel) {
      this.searchProductModel = searchProductModel;
      emit(SearchProductLoaded(searchProductModel));
    }, onError: (dynamic error, dynamic stack) {
      show(error);
      show(stack);
      emit(SearchProductFailure(handleError(error)));
    });
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
    List<Datum>? data = searchProductModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      SearchProductLoaded(searchProductModel).copyWith(
        searchProductModel: searchProductModel.copyWith(data: data),
      ),
    );
    searchProductModel = searchProductModel.copyWith(data: data);
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
    List<Datum>? data = searchProductModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(
          cartQuantity: isAdd ? quanitity + 1 : quanitity - 1,
          isAddedToCart: 1,
        );
      }
      return e;
    }).toList();
    emit(
      SearchProductLoaded(searchProductModel).copyWith(
        searchProductModel: searchProductModel.copyWith(data: data),
      ),
    );
    searchProductModel = searchProductModel.copyWith(data: data);
  }
}
