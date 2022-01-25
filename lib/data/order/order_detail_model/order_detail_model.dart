// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class OrderDetailModel extends Equatable {
  final List<Datum>? data;
  final bool? success;
  final int? status;
  final num? grand_total;

  const OrderDetailModel({
    this.data,
    this.success,
    this.status,
    this.grand_total,
  });

  factory OrderDetailModel.fromMap(Map<String, dynamic> data) {
    return OrderDetailModel(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
      success: data['success'] as bool?,
      status: data['status'] as int?,
      grand_total: data['grand_total'] as num?,
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
        'success': success,
        'status': status,
        'grand_total': grand_total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderDetailModel].
  factory OrderDetailModel.fromJson(String data) {
    return OrderDetailModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderDetailModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderDetailModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return OrderDetailModel(
      data: data ?? this.data,
      success: success ?? this.success,
      status: status ?? this.status,
      grand_total: grand_total ?? this.grand_total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, success, status, grand_total];
}
