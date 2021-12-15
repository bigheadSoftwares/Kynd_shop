import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'sub_category_products_model.g.dart';

@JsonSerializable()
class SubCategoryProductsModel extends Equatable {
  const SubCategoryProductsModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory SubCategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return _$SubCategoryProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubCategoryProductsModelToJson(this);

  SubCategoryProductsModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return SubCategoryProductsModel(
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
