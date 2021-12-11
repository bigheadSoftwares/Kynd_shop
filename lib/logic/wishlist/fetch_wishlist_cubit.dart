import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/wishlist/wishlist_model/wishlist_model.dart';
import '../../data/wishlist/wishlist_repository.dart';

part 'fetch_wishlist_state.dart';

class FetchWishlistCubit extends Cubit<FetchWishlistState> {
  FetchWishlistCubit() : super(FetchWishlistInitial());
  void fetchWishlist() {
    emit(FetchWishlistInitial());
    WishlistRepository.getWishlist().then(
        (WishlistModel wishlistModel) => emit(
              FetchWishlistLoaded(wishlistModel),
            ), onError: (dynamic error, dynamic stack) {
      emit(
        FetchWishlistFailure(
          handleError(error),
        ),
      );
    });
  }
}
