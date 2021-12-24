import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel extends Equatable {
  const ProductDetailModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);

  ProductDetailModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return ProductDetailModel(
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
