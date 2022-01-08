import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
  final int? id;
  final int? userId;
  final String? points;
  final String? title;
  final int? orderId;
  final String? date;
  final int? status;
  final String? createdAt;
  final String? updatedAt;

  const Datum({
    this.id,
    this.userId,
    this.points,
    this.title,
    this.orderId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        points: data['points'] as String?,
        title: data['title'] as String?,
        orderId: data['order_id'] as int?,
        date: data['date'] as String?,
        status: data['status'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'points': points,
        'title': title,
        'order_id': orderId,
        'date': date,
        'status': status,
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
    int? userId,
    String? points,
    String? title,
    int? orderId,
    String? date,
    int? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return Datum(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      points: points ?? this.points,
      title: title ?? this.title,
      orderId: orderId ?? this.orderId,
      date: date ?? this.date,
      status: status ?? this.status,
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
      userId,
      points,
      title,
      orderId,
      date,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
