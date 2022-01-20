import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kynd_shop/utils/export_utilities.dart';
import '../../data/cart/cart_repository.dart';
import '../../data/cart/cart_summary_model.dart';

part 'cart_summary_state.dart';

class CartSummaryCubit extends Cubit<CartSummaryState> {
  CartSummaryCubit() : super(CartSummaryInitial());

  void getCartSummary() {
    // print('This is called');
    // emit(CartSummaryLoading());
    CartRepository.getCartSummary().then(
      (CartSummaryModel cartSummaryModel) => emit(
        CartSummaryLoaded(cartSummaryModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          CartSummaryFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
