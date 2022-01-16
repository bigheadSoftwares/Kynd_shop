import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/wishlist/wishlist_model/datum.dart';
import '../../data/wishlist/wishlist_model/wishlist_model.dart';
import '../../data/wishlist/wishlist_repository.dart';

part 'fetch_wishlist_state.dart';

class FetchWishlistCubit extends Cubit<FetchWishlistState> {
  FetchWishlistCubit() : super(FetchWishlistInitial());
  WishlistModel wishlistModel = const WishlistModel();
  void fetchWishlist() {
    emit(FetchWishlistInitial());
    WishlistRepository.getWishlist().then((WishlistModel wishlistModel) {
      this.wishlistModel = wishlistModel;
      emit(
        FetchWishlistLoaded(wishlistModel),
      );
    }, onError: (dynamic error, dynamic stack) {
      emit(
        FetchWishlistFailure(
          handleError(error),
        ),
      );
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
    List<Datum>? data = wishlistModel.data?.map((Datum e) {
      if (e.product!.productId == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      FetchWishlistLoaded(wishlistModel).copyWith(
        wishlistModel: wishlistModel.copyWith(data: data),
      ),
    );
    wishlistModel = wishlistModel.copyWith(data: data);
  }
}
