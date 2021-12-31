// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      thumbnailImage: json['thumbnail_image'] as String?,
      basePrice: json['base_price'] as int?,
      baseDiscountedPrice: json['base_discounted_price'] as int?,
      whatsNew: json['whats_new'] as int?,
      combo: json['combo'] as int?,
      unit: json['unit'] as String?,
      discount: json['discount'] as int?,
      discountType: json['discount_type'] as String?,
      rating: json['rating'] as int?,
      sales: json['sales'] as int?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail_image': instance.thumbnailImage,
      'base_price': instance.basePrice,
      'base_discounted_price': instance.baseDiscountedPrice,
      'whats_new': instance.whatsNew,
      'combo': instance.combo,
      'unit': instance.unit,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'rating': instance.rating,
      'sales': instance.sales,
      'slug': instance.slug,
    };
