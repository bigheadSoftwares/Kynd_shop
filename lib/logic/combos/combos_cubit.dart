import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/wishlist/wishlist_data_provider.dart';
import '../../data/combos/combos_model.dart';
import '../../data/combos/combos_repository.dart';

part 'combos_state.dart';

class CombosCubit extends Cubit<CombosState> {
  CombosCubit() : super(CombosInitial());
  CombosModel combosModel = CombosModel();

  void getCombos() {
    CombosRepository.getCombos().then(
      (CombosModel combosModel) {
        this.combosModel = combosModel;
        emit(
          CombosLoaded(combosModel),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          CombosFailure(
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
    print('updating model $productId $isAdd');
    List<Datum>? data = combosModel.data?.map((Datum e) {
      if (e.id == productId) {
        return e.copyWith(isWishlisted: isAdd ? 1 : 0);
      }
      return e;
    }).toList();
    emit(
      CombosLoaded(combosModel).copyWith(
        combosModel: combosModel.copyWith(data: data),
      ),
    );
    combosModel = combosModel.copyWith(data: data);
  }

  @override
  void onChange(Change<CombosState> change) {
    super.onChange(change);
    print(change);
  }
}
