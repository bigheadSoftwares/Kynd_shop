import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import '../../data/brands/brands_repo.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsInitial());

  final BrandsRepository _brandsRepository = BrandsRepository();
  void fetchBrands() {
    emit(BrandsLoading());
    _brandsRepository.fetchBrands().then(
      (BrandsModel brands) {
        emit(BrandsSuccess(brands));
      },
      onError: (dynamic error, StackTrace trace) {
        emit(BrandsError(handleError(error)));
      },
    );
  }
}
