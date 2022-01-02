import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class CouponModel extends Equatable {
  final bool? success;
  final int? status;
  final List<Datum>? data;

  const CouponModel({this.success, this.status, this.data});

  factory CouponModel.fromMap(Map<String, dynamic> data) => CouponModel(
        success: data['success'] as bool?,
        status: data['status'] as int?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'status': status,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CouponModel].
  factory CouponModel.fromJson(String data) {
    return CouponModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CouponModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CouponModel copyWith({
    bool? success,
    int? status,
    List<Datum>? data,
  }) {
    return CouponModel(
      success: success ?? this.success,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, status, data];
}
