// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tax _$TaxFromJson(Map<String, dynamic> json) => Tax(
      id: json['id'] as int?,
      productId: json['product_id'] as int?,
      taxId: json['tax_id'] as int?,
      tax: json['tax'] as int?,
      taxType: json['tax_type'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TaxToJson(Tax instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'tax_id': instance.taxId,
      'tax': instance.tax,
      'tax_type': instance.taxType,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
