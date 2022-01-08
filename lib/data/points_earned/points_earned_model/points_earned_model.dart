import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class PointsEarnedModel extends Equatable {
  final List<Datum>? data;

  const PointsEarnedModel({this.data});

  factory PointsEarnedModel.fromMap(Map<String, dynamic> data) {
    return PointsEarnedModel(
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
  /// Parses the string and returns the resulting Json object as [PointsEarnedModel].
  factory PointsEarnedModel.fromJson(String data) {
    return PointsEarnedModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PointsEarnedModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PointsEarnedModel copyWith({
    List<Datum>? data,
  }) {
    return PointsEarnedModel(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
