part of 'bestsellers_cubit.dart';

abstract class BestsellersState extends Equatable {
  const BestsellersState();

  @override
  List<Object> get props => <Object>[];
}

class BestsellersInitial extends BestsellersState {}

class BestsellersLoading extends BestsellersState {}

class BestsellersLoaded extends BestsellersState {
  const BestsellersLoaded(this.bestSellersModel);
  final BestSellersModel bestSellersModel;

  @override
  List<Object> get props => <Object>[bestSellersModel];
}

class BestsellersFailure extends BestsellersState {
  const BestsellersFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => <Object>[failure];
}
