import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategoryModel extends Equatable {
  const SubCategoryModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return _$SubCategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);

  SubCategoryModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return SubCategoryModel(
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
