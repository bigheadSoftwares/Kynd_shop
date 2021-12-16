import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/new_products/new_products_repository.dart';
import '../../data/new_products/new_products_model.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit() : super(NewProductsInitial());
  NewProductsModel newProductsModel = NewProductsModel();
  void getNewProducts() {
    NewProductsRepository.newProducts().then(
      (NewProductsModel newProductsModel) {
        this.newProductsModel = newProductsModel;
        emit(
          NewProductsLoaded(newProductsModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          NewProductsFailure(
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
    List<Datum>? data = newProductsModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      NewProductsLoaded(newProductsModel).copyWith(
        newProductsModel: newProductsModel.copyWith(data: data),
      ),
    );
    newProductsModel = newProductsModel.copyWith(data: data);
  }
}
