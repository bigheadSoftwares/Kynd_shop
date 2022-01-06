// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum SortByEnum {
  price_high_to_low,
  price_low_to_high,
  new_arrival,
  popularity,
  top_rated
}

class SelectedFilterModel extends Equatable {
  final Set<String> brandSet;
  final int min;
  final int max;
  final SortByEnum sortBy;

  const SelectedFilterModel({
    required this.brandSet,
    required this.min,
    required this.max,
    required this.sortBy,
  });

  @override
  List<Object?> get props => <Object>[
        brandSet,
        min,
        max,
        sortBy,
      ];

  SelectedFilterModel copyWith({
    Set<String>? brandSet,
    int? min,
    int? max,
    SortByEnum? sortBy,
  }) {
    return SelectedFilterModel(
      brandSet: brandSet ?? this.brandSet,
      min: min ?? this.min,
      max: max ?? this.max,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
