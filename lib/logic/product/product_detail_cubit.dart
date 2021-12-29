import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/product/product_repository.dart';
import '../../data/product/product_detail_model/product_detail_model.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());
  void getProductDetail(int productId) {
    emit(ProductDetailInitial());
    ProductRepository.getProductDetail(productId).then(
      (ProductDetailModel _productDetailModel) => emit(
        ProductDetailLoaded(_productDetailModel),
      ),
      onError: (dynamic error, dynamic stack) {
        emit(
          ProductDetailFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
