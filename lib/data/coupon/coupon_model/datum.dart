import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? type;
  final String? code;
  final int? discount;
  final String? discountType;
  final String? minBuy;
  final String? maxDiscount;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.type,
    this.code,
    this.discount,
    this.discountType,
    this.minBuy,
    this.maxDiscount,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        type: data['type'] as String?,
        code: data['code'] as String?,
        discount: data['discount'] as int?,
        discountType: data['discount_type'] as String?,
        minBuy: data['min_buy'] as String?,
        maxDiscount: data['max_discount'] as String?,
        startDate: data['start_date'] as String?,
        endDate: data['end_date'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'code': code,
        'discount': discount,
        'discount_type': discountType,
        'min_buy': minBuy,
        'max_discount': maxDiscount,
        'start_date': startDate,
        'end_date': endDate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    int? id,
    String? type,
    String? code,
    int? discount,
    String? discountType,
    String? minBuy,
    String? maxDiscount,
    String? startDate,
    String? endDate,
    String? createdAt,
    String? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      type: type ?? this.type,
      code: code ?? this.code,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      minBuy: minBuy ?? this.minBuy,
      maxDiscount: maxDiscount ?? this.maxDiscount,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      type,
      code,
      discount,
      discountType,
      minBuy,
      maxDiscount,
      startDate,
      endDate,
      createdAt,
      updatedAt,
    ];
  }
}
