import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class CoupnModel extends Equatable {
  final List<Datum>? data;

  const CoupnModel({this.data});

  factory CoupnModel.fromMap(Map<String, dynamic> data) => CoupnModel(
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CoupnModel].
  factory CoupnModel.fromJson(String data) {
    return CoupnModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CoupnModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CoupnModel copyWith({
    List<Datum>? data,
  }) {
    return CoupnModel(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
