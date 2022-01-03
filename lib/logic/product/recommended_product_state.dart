part of 'recommended_product_cubit.dart';

abstract class RecommendedProductState extends Equatable {
  const RecommendedProductState();

  @override
  List<Object> get props => <Object>[];
}

class RecommendedProductInitial extends RecommendedProductState {}

class RecommendedProductLoaded extends RecommendedProductState {
  final RecommendedProductModel recommendedProductModel;
  const RecommendedProductLoaded(this.recommendedProductModel);
  @override
  List<Object> get props => <Object>[recommendedProductModel];

  RecommendedProductLoaded copyWith({
    RecommendedProductModel? recommendedProductModel,
  }) {
    return RecommendedProductLoaded(
      recommendedProductModel ?? this.recommendedProductModel,
    );
  }
}

class RecommendedProductFailure extends RecommendedProductState {
  final Failure failure;
  const RecommendedProductFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
