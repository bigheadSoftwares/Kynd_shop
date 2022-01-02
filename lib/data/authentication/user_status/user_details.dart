import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final int? id;
  final String? userType;
  final String? name;
  final String? email;
  final String? dob;

  const UserDetails({
    this.id,
    this.userType,
    this.name,
    this.email,
    this.dob,
  });

  factory UserDetails.fromMap(Map<String, dynamic> data) => UserDetails(
        id: data['id'] as int?,
        userType: data['user_type'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        dob: data['dob'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_type': userType,
        'name': name,
        'email': email,
        'dob': dob,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDetails].
  factory UserDetails.fromJson(String data) {
    return UserDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  UserDetails copyWith({
    int? id,
    String? userType,
    String? name,
    String? email,
    String? dob,
  }) {
    return UserDetails(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      name: name ?? this.name,
      email: email ?? this.email,
      dob: dob ?? this.dob,
    );
  }

  @override
  List<Object?> get props => [id, userType, name, email, dob];
}
