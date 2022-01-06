import 'package:bloc/bloc.dart';
import '../../data/filter/selected_filter.dart';

class SelectedFilterCubit extends Cubit<SelectedFilterModel> {
  SelectedFilterCubit()
      : super(const SelectedFilterModel(
            brandSet: <String>{},
            min: 50,
            max: 10000,
            sortBy: SortByEnum.price_low_to_high));

  void updateBrandSet(String brandName) {
    if (state.brandSet.contains(brandName)) {
      state.brandSet.remove(brandName);
      emit(state.copyWith(brandSet: state.brandSet));
    } else {
      state.brandSet.add(brandName);

      emit(state.copyWith(brandSet: state.brandSet));
    }
  }

  void updateMin(int min) {
    emit(state.copyWith(min: min));
  }

  void updateMax(int max) {
    emit(state.copyWith(max: max));
  }

  void updateSortBy(SortByEnum sortByEnum) {
    emit(state.copyWith(sortBy: sortByEnum));
  }
}
