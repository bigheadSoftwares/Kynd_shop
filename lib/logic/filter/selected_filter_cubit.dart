import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/filter/selected_filter.dart';

class SelectedFilterCubit extends Cubit<SelectedFilterModel> {
  SelectedFilterCubit()
      : super(const SelectedFilterModel(
          brandSet: <String>{},
          priceRange: RangeValues(50, 10000),
          sortBy: SortByEnum.price_low_to_high,
        ));

  void updateBrandSet(Set<String> brandSet) {
    emit(state.copyWith(brandSet: brandSet));
  }

  void updateRange(double min, double max) {
    emit(state.copyWith(priceRange: RangeValues(min, max)));
  }

  void updateSortBy(SortByEnum sortByEnum) {
    emit(state.copyWith(sortBy: sortByEnum));
  }
}
