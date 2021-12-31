import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'brand.dart';
import 'category.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.id,
    this.name,
    this.addedBy,
    this.category,
    this.brand,
    this.photos,
    this.thumbnailImage,
    this.tags,
    this.priceLower,
    this.priceHigher,
    this.whatsNew,
    this.combo,
    this.currentStock,
    this.unit,
    this.discount,
    this.discountType,
    this.tax,
    this.taxType,
    this.shippingType,
    this.shippingCost,
    this.numberOfSales,
    this.rating,
    this.ratingCount,
    this.description,
    this.isUserLogin,
    this.customerId,
    this.isAddedToCart,
    this.cartQuantity,
    this.isWishlisted,
  });

  final int? id;
  final String? name;
  @JsonKey(name: 'added_by')
  final String? addedBy;
  final Category? category;
  final Brand? brand;
  final List<String>? photos;
  @JsonKey(name: 'thumbnail_image')
  final String? thumbnailImage;
  final List<String>? tags;
  @JsonKey(name: 'price_lower')
  final int? priceLower;
  @JsonKey(name: 'price_higher')
  final int? priceHigher;
  @JsonKey(name: 'whats_new')
  final int? whatsNew;
  final int? combo;
  @JsonKey(name: 'current_stock')
  final int? currentStock;
  final String? unit;
  final int? discount;
  @JsonKey(name: 'discount_type')
  final String? discountType;
  final int? tax;
  @JsonKey(name: 'tax_type')
  final String? taxType;
  @JsonKey(name: 'shipping_type')
  final String? shippingType;
  @JsonKey(name: 'shipping_cost')
  final int? shippingCost;
  @JsonKey(name: 'number_of_sales')
  final int? numberOfSales;
  final int? rating;
  @JsonKey(name: 'rating_count')
  final int? ratingCount;
  final String? description;
  @JsonKey(name: 'is_user_login')
  final int? isUserLogin;
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @JsonKey(name: 'is_added_to_cart')
  final bool? isAddedToCart;
  @JsonKey(name: 'cart_quantity')
  final int? cartQuantity;
  @JsonKey(name: 'is_wishlisted')
  final int? isWishlisted;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? name,
    String? addedBy,
    Category? category,
    Brand? brand,
    List<String>? photos,
    String? thumbnailImage,
    List<String>? tags,
    int? priceLower,
    int? priceHigher,
    int? whatsNew,
    int? combo,
    int? currentStock,
    String? unit,
    int? discount,
    String? discountType,
    int? tax,
    String? taxType,
    String? shippingType,
    int? shippingCost,
    int? numberOfSales,
    int? rating,
    int? ratingCount,
    String? description,
    int? isUserLogin,
    int? customerId,
    bool? isAddedToCart,
    int? cartQuantity,
    int? isWishlisted,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      addedBy: addedBy ?? this.addedBy,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      photos: photos ?? this.photos,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      tags: tags ?? this.tags,
      priceLower: priceLower ?? this.priceLower,
      priceHigher: priceHigher ?? this.priceHigher,
      whatsNew: whatsNew ?? this.whatsNew,
      combo: combo ?? this.combo,
      currentStock: currentStock ?? this.currentStock,
      unit: unit ?? this.unit,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      tax: tax ?? this.tax,
      taxType: taxType ?? this.taxType,
      shippingType: shippingType ?? this.shippingType,
      shippingCost: shippingCost ?? this.shippingCost,
      numberOfSales: numberOfSales ?? this.numberOfSales,
      rating: rating ?? this.rating,
      ratingCount: ratingCount ?? this.ratingCount,
      description: description ?? this.description,
      isUserLogin: isUserLogin ?? this.isUserLogin,
      customerId: customerId ?? this.customerId,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      cartQuantity: cartQuantity ?? this.cartQuantity,
      isWishlisted: isWishlisted ?? this.isWishlisted,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      addedBy,
      category,
      brand,
      photos,
      thumbnailImage,
      tags,
      priceLower,
      priceHigher,
      whatsNew,
      combo,
      currentStock,
      unit,
      discount,
      discountType,
      tax,
      taxType,
      shippingType,
      shippingCost,
      numberOfSales,
      rating,
      ratingCount,
      description,
      isUserLogin,
      customerId,
      isAddedToCart,
      cartQuantity,
      isWishlisted,
    ];
  }
}
