import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends Equatable {
  const CategoryModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  CategoryModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return CategoryModel(
      data: data ?? this.data,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => <Object?>[data, success, status];
}
