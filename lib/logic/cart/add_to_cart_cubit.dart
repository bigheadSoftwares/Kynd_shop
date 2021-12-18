import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/cart/cart_data_provider.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());
  void addToCart(int productId, int quantity) {
    emit(AddToCartLoading());
    CartDataProvider.addToCart(
      productId: productId,
      quantity: quantity,
    ).then((bool value) {
      if (value == true) {
        emit(
          AddToCartLoaded(),
        );
      } else {
        emit(
          const AddToCartFailure(
            Failure(
              message: 'Something went wrong',
              type: errorType.others,
              serverMessage: '',
            ),
          ),
        );
      }
    }, onError: (dynamic error, dynamic stack) {
      emit(
        AddToCartFailure(
          handleError(error),
        ),
      );
    });
  }
}
