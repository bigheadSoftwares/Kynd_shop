import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/cart/cart_repository.dart';
import '../../data/cart/cart_detaiils_model/cart_detaiils_model.dart';

part 'cart_details_state.dart';

class CartDetailsCubit extends Cubit<CartDetailsState> {
  CartDetailsCubit() : super(CartDetailsInitial());

  void getCartDetails() {
    CartRepository.getCartDetails().then(
      (CartDetaiilsModel cartDetaiilsModel) => emit(
        CartDetailsLoaded(cartDetaiilsModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          CartDetailsFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
