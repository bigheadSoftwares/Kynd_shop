import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'order_detail_model.g.dart';

@JsonSerializable()
class OrderDetailModel extends Equatable {
  const OrderDetailModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) {
    return _$OrderDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);

  OrderDetailModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return OrderDetailModel(
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
