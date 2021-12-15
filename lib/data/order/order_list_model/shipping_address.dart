import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddress extends Equatable {
  const ShippingAddress({
    this.id,
    this.userId,
    this.address,
    this.country,
    this.city,
    this.longitude,
    this.latitude,
    this.postalCode,
    this.phone,
    this.setDefault,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.email,
  });

  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? address;
  final String? country;
  final dynamic city;
  final dynamic longitude;
  final dynamic latitude;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? phone;
  @JsonKey(name: 'set_default')
  final int? setDefault;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String? name;
  final String? email;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return _$ShippingAddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);

  ShippingAddress copyWith({
    int? id,
    int? userId,
    String? address,
    String? country,
    dynamic city,
    dynamic longitude,
    dynamic latitude,
    String? postalCode,
    String? phone,
    int? setDefault,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? email,
  }) {
    return ShippingAddress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      postalCode: postalCode ?? this.postalCode,
      phone: phone ?? this.phone,
      setDefault: setDefault ?? this.setDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      address,
      country,
      city,
      longitude,
      latitude,
      postalCode,
      phone,
      setDefault,
      createdAt,
      updatedAt,
      name,
      email,
    ];
  }
}
