import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'recommended_product_model.g.dart';

@JsonSerializable()
class RecommendedProductModel extends Equatable {
  const RecommendedProductModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory RecommendedProductModel.fromJson(Map<String, dynamic> json) {
    return _$RecommendedProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecommendedProductModelToJson(this);

  RecommendedProductModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return RecommendedProductModel(
      data: data ?? this.data,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, success, status];
}
