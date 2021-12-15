import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class CartDetaiilsModel extends Equatable {
  final List<Datum>? data;

  const CartDetaiilsModel({this.data});

  factory CartDetaiilsModel.fromMap(Map<String, dynamic> data) {
    return CartDetaiilsModel(
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CartDetaiilsModel].
  factory CartDetaiilsModel.fromJson(String data) {
    return CartDetaiilsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartDetaiilsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CartDetaiilsModel copyWith({
    List<Datum>? data,
  }) {
    return CartDetaiilsModel(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
