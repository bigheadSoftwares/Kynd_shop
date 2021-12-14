part of 'fetch_wishlist_cubit.dart';

abstract class FetchWishlistState extends Equatable {
  const FetchWishlistState();

  @override
  List<Object> get props => <Object>[];
}

class FetchWishlistInitial extends FetchWishlistState {}

class FetchWishlistLoaded extends FetchWishlistState {
  final WishlistModel wishlistModel;
  const FetchWishlistLoaded(this.wishlistModel);
  @override
  List<Object> get props => <Object>[wishlistModel];
}

class FetchWishlistFailure extends FetchWishlistState {
  final Failure failure;
  const FetchWishlistFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
