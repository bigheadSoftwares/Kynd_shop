part of 'brands_cubit.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => <Object>[];
}

class BrandsInitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsSuccess extends BrandsState {
  const BrandsSuccess(this.brandsModel);
  final BrandsModel brandsModel;

@override
  List<Object> get props => <BrandsModel>[brandsModel];
}

class BrandsError extends BrandsState {
  const BrandsError(this.error);
  final Failure error;

  @override
  List<Object> get props => <Failure>[error];
}
