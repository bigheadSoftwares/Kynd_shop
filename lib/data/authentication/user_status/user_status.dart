import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'data.dart';

class UserStatus extends Equatable {
  final Data? data;

  const UserStatus({this.data});

  factory UserStatus.fromMap(Map<String, dynamic> data) => UserStatus(
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserStatus].
  factory UserStatus.fromJson(String data) {
    return UserStatus.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserStatus] to a JSON string.
  String toJson() => json.encode(toMap());

  UserStatus copyWith({
    Data? data,
  }) {
    return UserStatus(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [data];
}
