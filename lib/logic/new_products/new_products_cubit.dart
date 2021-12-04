import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/new_products/new_products_repository.dart';
import '../../data/new_products/new_products_model.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit() : super(NewProductsInitial());
  void getNewProducts() {
    // NewProductsRepository.newProducts().then(
    //   (NewProductsModel newProductsModel) => emit(
    //     NewProductsLoaded(newProductsModel),
    //   ),
    //   onError: (dynamic error, dynamic stack) {
    //     emit(
    //       NewProductsFailure(
    //         handleError(error),
    //       ),
    //     );
    //   },
    // );
  }
}
