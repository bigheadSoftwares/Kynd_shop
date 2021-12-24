import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/product/product_detail_model/datum.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/product/product_repository.dart';
import '../../data/product/product_detail_model/product_detail_model.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());
  ProductDetailModel productDetailModel = const ProductDetailModel();
  void getProductDetail(int productId) {
    emit(ProductDetailInitial());
    ProductRepository.getProductDetail(productId).then(
      (ProductDetailModel _productDetailModel) {
        productDetailModel = _productDetailModel;
        return emit(
          ProductDetailLoaded(_productDetailModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        log(error.toString());
        log(stack.toString());
        emit(
          ProductDetailFailure(
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
    List<Datum>? data = productDetailModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      ProductDetailLoaded(productDetailModel).copyWith(
        productDetailModel: productDetailModel.copyWith(data: data),
      ),
    );
    productDetailModel = productDetailModel.copyWith(data: data);
  }
}
