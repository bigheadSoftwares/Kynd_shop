import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class UserStatusData extends Equatable {
  final Data? data;

  const UserStatusData({this.data});

  factory UserStatusData.fromMap(Map<String, dynamic> data) {
    return UserStatusData(
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserStatusData].
  factory UserStatusData.fromJson(String data) {
    return UserStatusData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserStatusData] to a JSON string.
  String toJson() => json.encode(toMap());

  UserStatusData copyWith({
    Data? data,
  }) {
    return UserStatusData(
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data];
}
