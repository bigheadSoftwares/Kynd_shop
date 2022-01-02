// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      addedBy: json['added_by'] as String?,
      userId: json['user_id'] as int?,
      categoryId: json['category_id'] as int?,
      brandId: json['brand_id'] as int?,
      thumbnailImg: json['thumbnail_img'] as String?,
      tags: json['tags'] as String?,
      description: json['description'] as String?,
      unitPrice: json['unit_price'] as int?,
      purchasePrice: json['purchase_price'] as String?,
      variantProduct: json['variant_product'] as int?,
      attributes: json['attributes'] as String?,
      choiceOptions: json['choice_options'] as String?,
      colors: json['colors'] as String?,
      variations: json['variations'] as String?,
      todaysDeal: json['todays_deal'] as int?,
      published: json['published'] as int?,
      approved: json['approved'] as int?,
      stockVisibilityState: json['stock_visibility_state'] as String?,
      cashOnDelivery: json['cash_on_delivery'] as int?,
      featured: json['featured'] as int?,
      sellerFeatured: json['seller_featured'] as int?,
      currentStock: json['current_stock'] as int?,
      unit: json['unit'] as String?,
      minQty: json['min_qty'] as int?,
      lowStockQuantity: json['low_stock_quantity'] as int?,
      discount: json['discount'] as int?,
      discountType: json['discount_type'] as String?,
      discountStartDate: json['discount_start_date'] as int?,
      discountEndDate: json['discount_end_date'] as int?,
      tax: json['tax'] as String?,
      taxType: json['tax_type'] as String?,
      shippingType: json['shipping_type'] as String?,
      shippingCost: json['shipping_cost'] as String?,
      isQuantityMultiplied: json['is_quantity_multiplied'] as int?,
      estShippingDays: json['est_shipping_days'] as int?,
      numOfSale: json['num_of_sale'] as int?,
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
      metaImg: json['meta_img'] as String?,
      recommendedIds: json['recommended_ids'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      whatsNew: json['whats_new'] as int?,
      combo: json['combo'] as int?,
      sales: json['sales'] as int?,
      baseDiscountedPrice: json['base_discounted_price'] as int?,
      basePrice: json['base_price'] as int?,
      isUserLogin: json['is_user_login'] as int?,
      customerId: json['customer_id'] as String?,
      isAddedToCart: json['is_added_to_cart'] as int?,
      cartQuantity: json['cart_quantity'] as int?,
      isWishlisted: json['is_wishlisted'] as int?,
      taxes: (json['taxes'] as List<dynamic>?)
          ?.map((e) => Tax.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'added_by': instance.addedBy,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'brand_id': instance.brandId,
      'thumbnail_img': instance.thumbnailImg,
      'tags': instance.tags,
      'description': instance.description,
      'unit_price': instance.unitPrice,
      'purchase_price': instance.purchasePrice,
      'variant_product': instance.variantProduct,
      'attributes': instance.attributes,
      'choice_options': instance.choiceOptions,
      'colors': instance.colors,
      'variations': instance.variations,
      'todays_deal': instance.todaysDeal,
      'published': instance.published,
      'approved': instance.approved,
      'stock_visibility_state': instance.stockVisibilityState,
      'cash_on_delivery': instance.cashOnDelivery,
      'featured': instance.featured,
      'seller_featured': instance.sellerFeatured,
      'current_stock': instance.currentStock,
      'unit': instance.unit,
      'min_qty': instance.minQty,
      'low_stock_quantity': instance.lowStockQuantity,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'discount_start_date': instance.discountStartDate,
      'discount_end_date': instance.discountEndDate,
      'tax': instance.tax,
      'tax_type': instance.taxType,
      'shipping_type': instance.shippingType,
      'shipping_cost': instance.shippingCost,
      'is_quantity_multiplied': instance.isQuantityMultiplied,
      'est_shipping_days': instance.estShippingDays,
      'num_of_sale': instance.numOfSale,
      'meta_title': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'meta_img': instance.metaImg,
      'recommended_ids': instance.recommendedIds,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'whats_new': instance.whatsNew,
      'combo': instance.combo,
      'sales': instance.sales,
      'base_discounted_price': instance.baseDiscountedPrice,
      'base_price': instance.basePrice,
      'is_user_login': instance.isUserLogin,
      'customer_id': instance.customerId,
      'is_added_to_cart': instance.isAddedToCart,
      'cart_quantity': instance.cartQuantity,
      'is_wishlisted': instance.isWishlisted,
      'taxes': instance.taxes,
    };
