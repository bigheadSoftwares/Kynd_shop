// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      phone: json['phone'] as String?,
      setDefault: json['set_default'] as int?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'phone': instance.phone,
      'set_default': instance.setDefault,
    };