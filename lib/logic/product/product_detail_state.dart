part of 'product_detail_cubit.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => <Object>[];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetailModel productDetailModel;
  const ProductDetailLoaded(this.productDetailModel);
  @override
  List<Object> get props => <Object>[productDetailModel];

  ProductDetailLoaded copyWith({
    ProductDetailModel? productDetailModel,
  }) {
    return ProductDetailLoaded(
      productDetailModel ?? this.productDetailModel,
    );
  }
}

class ProductDetailFailure extends ProductDetailState {
  final Failure failure;
  const ProductDetailFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
