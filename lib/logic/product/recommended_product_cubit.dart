import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/data/cart/cart_data_provider.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../data/product/recommended_product_model/datum.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/product/product_repository.dart';
import '../../data/product/recommended_product_model/recommended_product_model.dart';

part 'recommended_product_state.dart';

class RecommendedProductCubit extends Cubit<RecommendedProductState> {
  RecommendedProductCubit() : super(RecommendedProductInitial());
  RecommendedProductModel recommendedProductModel =
      const RecommendedProductModel();
  void getRecommendedProducts() {
    ProductRepository.recommendedProducts().then(
        (RecommendedProductModel recommendedProductModel) {
      this.recommendedProductModel = recommendedProductModel;
      emit(RecommendedProductLoaded(recommendedProductModel));
    }, onError: (dynamic error, dynamic stack) {
      emit(RecommendedProductFailure(handleError(error)));
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
    List<Datum>? data = recommendedProductModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      RecommendedProductLoaded(recommendedProductModel).copyWith(
        recommendedProductModel: recommendedProductModel.copyWith(data: data),
      ),
    );
    recommendedProductModel = recommendedProductModel.copyWith(data: data);
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
    List<Datum>? data = recommendedProductModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(
          cartQuantity: isAdd ? quanitity + 1 : quanitity - 1,
          isAddedToCart: 1,
        );
      }
      return e;
    }).toList();
    emit(
      RecommendedProductLoaded(recommendedProductModel).copyWith(
        recommendedProductModel: recommendedProductModel.copyWith(data: data),
      ),
    );
    recommendedProductModel = recommendedProductModel.copyWith(data: data);
  }
}
