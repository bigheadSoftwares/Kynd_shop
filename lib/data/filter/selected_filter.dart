// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum SortByEnum {
  price_high_to_low,
  price_low_to_high,
  new_arrival,
  popularity,
  top_rated,
  none,
}

class SelectedFilterModel extends Equatable {
  final Set<int> brandSet;
  final RangeValues priceRange;
  final SortByEnum sortBy;

  const SelectedFilterModel({
    required this.brandSet,
    required this.priceRange,
    required this.sortBy,
  });

  @override
  List<Object?> get props => <Object>[
        brandSet,
        priceRange,
        sortBy,
      ];

  SelectedFilterModel copyWith({
    Set<int>? brandSet,
    RangeValues? priceRange,
    SortByEnum? sortBy,
  }) {
    return SelectedFilterModel(
      brandSet: brandSet ?? this.brandSet,
      priceRange: priceRange ?? this.priceRange,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
