import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/cart/cart_data_provider.dart';
import '../../data/cart/cart_detaiils_model/datum.dart';
import '../../data/cart/cart_summary_model.dart';
import '../../data/cart/cart_repository.dart';
import '../../data/cart/cart_detaiils_model/cart_detaiils_model.dart';

part 'cart_details_state.dart';

class CartDetailsCubit extends Cubit<CartDetailsState> {
  CartDetailsCubit() : super(CartDetailsInitial());
  CartDetaiilsModel cartDetaiilsModel = CartDetaiilsModel();
  void getCartDetails() {
    CartRepository.getCartDetails().then(
      (CartDetaiilsModel cartDetaiilsModel) {
        this.cartDetaiilsModel = cartDetaiilsModel;
        emit(
          CartDetailsLoaded(cartDetaiilsModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        print(error);
        emit(
          CartDetailsFailure(
            handleError(error),
          ),
        );
      },
    );
  }

  void addProductToCart(int cartId, int quantity) {
    updateCartModel(cartId, true, quantity);
    CartDataProvider.cartChangeQuantity(cartId: cartId, quantity: quantity + 1)
        .then((bool value) {
      if (!value) {
        updateCartModel(cartId, false, quantity);
      }
    });
  }

  void removeProductFromCart(int productId, int quantity) {
    updateCartModel(
        productId, false, quantity); //removing product from the model locally
    CartDataProvider.cartChangeQuantity(
            cartId: productId, quantity: quantity - 1)
        .then((bool value) {
      if (!value) {
        updateCartModel(
            productId, true, quantity); //wishlist again on server failure
      }
    });
  }

  void updateCartModel(int productId, bool isAdd, int quanitity) {
    List<Datum>? data = cartDetaiilsModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(
          quantity: isAdd ? quanitity + 1 : quanitity - 1,
        );
      }
      return e;
    }).toList();
    emit(
      CartDetailsLoaded(cartDetaiilsModel).copyWith(
        cartDetaiilsModel: cartDetaiilsModel.copyWith(data: data),
      ),
    );
    cartDetaiilsModel = cartDetaiilsModel.copyWith(data: data);
  }

  void removeCartItem(int cartId, int quantity) {
    updateRemoveItemModel(cartId); //removing product from the model locally
    CartDataProvider.cartDestroy(
      cartId,
    ).then((bool value) {
      if (!value) {
        updateRemoveItemModel(cartId,
            quantity: quantity); //wishlist again on server failure
      }
    });
  }

  updateRemoveItemModel(int id, {int? quantity}) {
    List<Datum>? data = cartDetaiilsModel.data?.map((Datum e) {
      if (e.id == id) {
        return e.copyWith(
          quantity: quantity ?? 0,
        );
      }
      return e;
    }).toList();
    emit(
      CartDetailsLoaded(cartDetaiilsModel).copyWith(
        cartDetaiilsModel: cartDetaiilsModel.copyWith(data: data),
      ),
    );
    cartDetaiilsModel = cartDetaiilsModel.copyWith(data: data);
  }


}
