// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };
