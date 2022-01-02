import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/product/product_repository.dart';
import '../../data/product/search_product_model/search_product_model.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit() : super(SearchProductInitial());
  void searchProduct(String query) {
    // emit(SearchProductInitial());
    ProductRepository.searchProduct(query).then(
        (SearchProductModel searchProductModel) =>
            emit(SearchProductLoaded(searchProductModel)),
        onError: (dynamic error, dynamic stack) {
      emit(SearchProductFailure(handleError(error)));
    });
  }
}
