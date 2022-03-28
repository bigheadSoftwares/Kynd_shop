// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LoginDataModel loginDataModelFromJson(String str) =>
    LoginDataModel.fromJson(json.decode(str) as Map<String, dynamic>);

String loginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel extends Equatable {
  LoginDataModel({
    required this.success,
  });

  Success success;

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        success: Success.fromJson(json["success"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
      };

  @override
  List<Object?> get props => [success];
}

class Success extends Equatable {
  Success({
    required this.customerId,
    required this.message,
    required this.userDetails,
    required this.code,
  });

  String message;
  int customerId;

  UserDetails userDetails;
  int code;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        message: json["message"] as String,
        customerId: json["customer_id"] as int,
        userDetails:
            UserDetails.fromJson(json["user_details"] as Map<String, dynamic>),
        code: json["code"] as int,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "customer_id": customerId,
        "code": code,
      };

  @override
  List<Object?> get props => [customerId, message, userDetails, code];
}

class UserDetails extends Equatable {
  UserDetails({
    required this.phone,
  });

  String phone;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        phone: json["phone"] as String,
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };

  @override
  List<Object?> get props => [phone];
}
