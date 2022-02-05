import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kynd_shop/logic/cart/cart_summary_cubit.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
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
    emit(CartDetailsInitial());
    CartRepository.getCartDetails().then(
      (CartDetaiilsModel cartDetaiilsModel) {
        this.cartDetaiilsModel = cartDetaiilsModel;
        emit(
          CartDetailsLoaded(cartDetaiilsModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          CartDetailsFailure(
            handleError(error),
          ),
        );
      },
    );
  }

  void addProductToCart(
      int cartId, int quantity, CartSummaryCubit cartSummary) {
    updateCartModel(cartId, true, quantity, cartSummary);
    CartDataProvider.cartChangeQuantity(cartId: cartId, quantity: quantity + 1)
        .then((bool value) {
      if (!value) {
        updateCartModel(cartId, false, quantity, cartSummary);
        print('THis is being called');
        cartSummary.getCartSummary();
      }
    });
  }

  void removeProductFromCart(
      int productId, int quantity, CartSummaryCubit cartSummary) {
    updateCartModel(productId, false, quantity,
        cartSummary); //removing product from the model locally
    CartDataProvider.cartChangeQuantity(
            cartId: productId, quantity: quantity - 1)
        .then((bool value) {
      if (!value) {
        updateCartModel(productId, true, quantity, cartSummary);
//wishlist again on server failure
      }
    });
  }

  void updateCartModel(
      int productId, bool isAdd, int quanitity, CartSummaryCubit cartSummary) {
    Timer(const Duration(seconds: 2), () {
      cartSummary.getCartSummary();
    });

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

  void removeCartItem(int cartId, int quantity, CartSummaryCubit cartSummary,
      BuildContext context) {
    updateRemoveItemModel(
        cartId, cartSummary); //removing product from the model locally
    CartDataProvider.cartDestroy(cartId, context).then((bool value) {
      if (!value) {
        updateRemoveItemModel(cartId, cartSummary, quantity: quantity);
        cartSummary.getCartSummary(); //wishlist again on server failure
      }
    });
  }

  void updateRemoveItemModel(int id, CartSummaryCubit cartSummary,
      {int? quantity}) {
    Timer(const Duration(seconds: 2), () {
      cartSummary.getCartSummary();
    });
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
