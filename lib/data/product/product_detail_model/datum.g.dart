// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      addedBy: json['added_by'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnailImage: json['thumbnail_image'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      priceLower: json['price_lower'] as int?,
      priceHigher: json['price_higher'] as int?,
      whatsNew: json['whats_new'] as int?,
      combo: json['combo'] as int?,
      currentStock: json['current_stock'] as int?,
      unit: json['unit'] as String?,
      discount: json['discount'] as int?,
      discountType: json['discount_type'] as String?,
      tax: json['tax'] as int?,
      taxType: json['tax_type'] as String?,
      shippingType: json['shipping_type'] as String?,
      shippingCost: json['shipping_cost'] as int?,
      numberOfSales: json['number_of_sales'] as int?,
      rating: json['rating'] as int?,
      ratingCount: json['rating_count'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'added_by': instance.addedBy,
      'category': instance.category,
      'brand': instance.brand,
      'photos': instance.photos,
      'thumbnail_image': instance.thumbnailImage,
      'tags': instance.tags,
      'price_lower': instance.priceLower,
      'price_higher': instance.priceHigher,
      'whats_new': instance.whatsNew,
      'combo': instance.combo,
      'current_stock': instance.currentStock,
      'unit': instance.unit,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'tax': instance.tax,
      'tax_type': instance.taxType,
      'shipping_type': instance.shippingType,
      'shipping_cost': instance.shippingCost,
      'number_of_sales': instance.numberOfSales,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'description': instance.description,
    };
