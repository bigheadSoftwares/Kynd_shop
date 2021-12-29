import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/wishlist/wishlist_data_provider.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
  void addWishlist(int productId) {
    WishlistDataProvider.addToWishlist(productId).then(
        (bool response) => emit(
              WishlistProgress(),
            ), onError: (dynamic error, dynamic stack) {
      emit(
        WishlistFailure(
          handleError(error),
        ),
      );
    });
  }
}