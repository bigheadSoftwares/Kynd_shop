import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/bestsellers/best_sellers_repository.dart';
import '../../data/bestsellers/best_sellers_model.dart';

part 'bestsellers_state.dart';

class BestsellersCubit extends Cubit<BestsellersState> {
  BestsellersCubit() : super(BestsellersInitial());
  BestSellersModel bestSellersModel = BestSellersModel();
  void getBestSellers() {
    emit(BestsellersLoading());
    BestSellersRepository.newProducts().then(
      (BestSellersModel bestSellersModel) {
        this.bestSellersModel = bestSellersModel;
        emit(
          BestsellersLoaded(bestSellersModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          BestsellersFailure(
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
    updateModel(productId, false);//removing product from the model locally
    WishlistDataProvider.removeWishlist(productId).then((bool value) {
      if (!value) {
        updateModel(productId, true);//wishlist again on server failure
      }
    });
  }

  void updateModel(int productId, bool isAdd) {
    List<Datum>? data = bestSellersModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      BestsellersLoaded(bestSellersModel).copyWith(
        bestSellersModel: bestSellersModel.copyWith(data: data),
      ),
    );
    bestSellersModel = bestSellersModel.copyWith(data: data);
  }
}
