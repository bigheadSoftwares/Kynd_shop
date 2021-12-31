import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

part 'search_product_model.g.dart';

@JsonSerializable()
class SearchProductModel extends Equatable {
  const SearchProductModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  final List<Datum>? data;
  final Links? links;
  final Meta? meta;
  final bool? success;
  final int? status;

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return _$SearchProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchProductModelToJson(this);

  SearchProductModel copyWith({
    List<Datum>? data,
    Links? links,
    Meta? meta,
    bool? success,
    int? status,
  }) {
    return SearchProductModel(
      data: data ?? this.data,
      links: links ?? this.links,
      meta: meta ?? this.meta,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, links, meta, success, status];
}
