import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'order_list_model.g.dart';

@JsonSerializable()
class OrderListModel extends Equatable {
  const OrderListModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory OrderListModel.fromJson(Map<String, dynamic> json) {
    return _$OrderListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderListModelToJson(this);

  OrderListModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return OrderListModel(
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
