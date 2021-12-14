part of 'wishlist_cubit.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => <Object>[];
}

class WishlistInitial extends WishlistState {}

class WishlistProgress extends WishlistState {}

class WishlistFailure extends WishlistState {
  const WishlistFailure(this.failure);
  final Failure failure;
  @override
  List<Object> get props => <Object>[failure];
}
