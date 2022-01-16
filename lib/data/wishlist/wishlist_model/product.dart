import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product({
    this.productId,
    this.name,
    this.thumbnailImage,
    this.basePrice,
    this.baseDiscountedPrice,
    this.unit,
    this.rating,
    this.customerId,
    this.isAddedToCart,
    this.cartQuantity,
  });

  @JsonKey(name: 'product_id')
  final int? productId;
  final String? name;
  @JsonKey(name: 'thumbnail_image')
  final String? thumbnailImage;
  @JsonKey(name: 'base_price')
  final int? basePrice;
  @JsonKey(name: 'base_discounted_price')
  final int? baseDiscountedPrice;
  final String? unit;
  final int? rating;
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'is_added_to_cart')
  final int? isAddedToCart;
  @JsonKey(name: 'cart_quantity')
  final int? cartQuantity;

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    int? productId,
    String? name,
    String? thumbnailImage,
    int? basePrice,
    int? baseDiscountedPrice,
    String? unit,
    int? rating,
    String? customerId,
    int? isAddedToCart,
    int? cartQuantity,
  }) {
    return Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      basePrice: basePrice ?? this.basePrice,
      baseDiscountedPrice: baseDiscountedPrice ?? this.baseDiscountedPrice,
      unit: unit ?? this.unit,
      rating: rating ?? this.rating,
      customerId: customerId ?? this.customerId,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      cartQuantity: cartQuantity ?? this.cartQuantity,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productId,
      name,
      thumbnailImage,
      basePrice,
      baseDiscountedPrice,
      unit,
      rating,
      customerId,
      isAddedToCart,
      cartQuantity,
    ];
  }
}
