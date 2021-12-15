// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) =>
    ShippingAddress(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      city: json['city'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
      setDefault: json['set_default'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'set_default': instance.setDefault,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'name': instance.name,
      'email': instance.email,
    };
