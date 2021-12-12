// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryProductsModel _$SubCategoryProductsModelFromJson(
        Map<String, dynamic> json) =>
    SubCategoryProductsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$SubCategoryProductsModelToJson(
        SubCategoryProductsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'status': instance.status,
    };
