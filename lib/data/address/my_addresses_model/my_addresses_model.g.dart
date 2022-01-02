// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_addresses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAddressesModel _$MyAddressesModelFromJson(Map<String, dynamic> json) =>
    MyAddressesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$MyAddressesModelToJson(MyAddressesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };
