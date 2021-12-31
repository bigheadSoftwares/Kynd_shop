part of 'search_product_cubit.dart';

abstract class SearchProductState extends Equatable {
  const SearchProductState();

  @override
  List<Object> get props => <Object>[];
}

class SearchProductInitial extends SearchProductState {}

class SearchProductLoaded extends SearchProductState {
  final SearchProductModel searchProductModel;
  const SearchProductLoaded(this.searchProductModel);
  @override
  List<Object> get props => <Object>[searchProductModel];
}

class SearchProductFailure extends SearchProductState {
  final Failure failure;
  const SearchProductFailure(this.failure);
  @override
  List<Object> get props => <Object>[failure];
}
