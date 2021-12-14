// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String?,
      thumbnailImage: json['thumbnail_image'] as String?,
      basePrice: json['base_price'] as int?,
      baseDiscountedPrice: json['base_discounted_price'] as int?,
      unit: json['unit'] as String?,
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'thumbnail_image': instance.thumbnailImage,
      'base_price': instance.basePrice,
      'base_discounted_price': instance.baseDiscountedPrice,
      'unit': instance.unit,
      'rating': instance.rating,
    };
