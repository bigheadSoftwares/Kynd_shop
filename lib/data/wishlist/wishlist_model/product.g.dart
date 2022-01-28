// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productId: json['product_id'] as int?,
      name: json['name'] as String?,
      thumbnailImage: json['thumbnail_image'] == null
          ? ''
          : json['thumbnail_image'] as String?,
      basePrice: json['base_price'] as int?,
      baseDiscountedPrice: json['base_discounted_price'] as int?,
      unit: json['unit'] as String?,
      rating: json['rating'] as int?,
      customerId: json['customer_id'] as String?,
      isAddedToCart: json['is_added_to_cart'] as int?,
      cartQuantity: json['cart_quantity'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_id': instance.productId,
      'name': instance.name,
      'thumbnail_image': instance.thumbnailImage,
      'base_price': instance.basePrice,
      'base_discounted_price': instance.baseDiscountedPrice,
      'unit': instance.unit,
      'rating': instance.rating,
      'customer_id': instance.customerId,
      'is_added_to_cart': instance.isAddedToCart,
      'cart_quantity': instance.cartQuantity,
    };
