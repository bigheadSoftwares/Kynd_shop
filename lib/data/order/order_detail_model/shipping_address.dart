import 'dart:convert';

import 'package:equatable/equatable.dart';

class ShippingAddress extends Equatable {
  final int? id;
  final int? userId;
  final String? address;
  final String? country;
  final dynamic city;
  final dynamic longitude;
  final dynamic latitude;
  final String? postalCode;
  final String? phone;
  final int? setDefault;
  final String? createdAt;
  final String? updatedAt;
  final String? name;
  final String? email;

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

  factory ShippingAddress.fromMap(Map<String, dynamic> data) {
    return ShippingAddress(
      id: data['id'] as int?,
      userId: data['user_id'] as int?,
      address: data['address'] as String?,
      country: data['country'] as String?,
      city: data['city'] as dynamic,
      longitude: data['longitude'] as dynamic,
      latitude: data['latitude'] as dynamic,
      postalCode: data['postal_code'] as String?,
      phone: data['phone'] as String?,
      setDefault: data['set_default'] as int?,
      createdAt: data['created_at'] as String?,
      updatedAt: data['updated_at'] as String?,
      name: data['name'] as String?,
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'address': address,
        'country': country,
        'city': city,
        'longitude': longitude,
        'latitude': latitude,
        'postal_code': postalCode,
        'phone': phone,
        'set_default': setDefault,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'name': name,
        'email': email,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShippingAddress].
  factory ShippingAddress.fromJson(String data) {
    return ShippingAddress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShippingAddress] to a JSON string.
  String toJson() => json.encode(toMap());

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
