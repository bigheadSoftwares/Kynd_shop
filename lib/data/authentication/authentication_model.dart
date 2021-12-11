part of 'authentication.dart';

AuthenticationModel authenticationModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str) as Map<String, dynamic>);

String authenticationModelToJson(AuthenticationModel data) =>
    json.encode(data.toJson());

class AuthenticationModel {
  AuthenticationModel({
   required this.success,
  });

  Success success;

  AuthenticationModel copyWith({
    Success? success,
  }) =>
      AuthenticationModel(
        success: success ?? this.success,
      );

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        success: Success.fromJson(json['success'] as Map<String,dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success.toJson(),
      };
}

class Success {
  Success({
   required this.customerId,
   required this.token,
  });

  int customerId;
  String token;

  Success copyWith({
    int? customerId,
    String? token,
  }) =>
      Success(
        customerId: customerId ?? this.customerId,
        token: token ?? this.token,
      );

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        customerId: json['customer_id']as int,
        token: json['token'] as String,
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'token': token,
      };
}
