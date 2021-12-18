import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final String? type;
  final String? code;
  final String? details;
  final int? discount;
  final String? discountType;
  final int? startDate;
  final int? endDate;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.type,
    this.code,
    this.details,
    this.discount,
    this.discountType,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        type: data['type'] as String?,
        code: data['code'] as String?,
        details: data['details'] as String?,
        discount: data['discount'] as int?,
        discountType: data['discount_type'] as String?,
        startDate: data['start_date'] as int?,
        endDate: data['end_date'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type,
        'code': code,
        'details': details,
        'discount': discount,
        'discount_type': discountType,
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
    String? details,
    int? discount,
    String? discountType,
    int? startDate,
    int? endDate,
    String? createdAt,
    String? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      type: type ?? this.type,
      code: code ?? this.code,
      details: details ?? this.details,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
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
      details,
      discount,
      discountType,
      startDate,
      endDate,
      createdAt,
      updatedAt,
    ];
  }
}
