import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product({
    this.name,
    this.thumbnailImage,
    this.basePrice,
    this.baseDiscountedPrice,
    this.unit,
    this.rating,
  });

  final String? name;
  @JsonKey(name: 'thumbnail_image')
  final String? thumbnailImage;
  @JsonKey(name: 'base_price')
  final int? basePrice;
  @JsonKey(name: 'base_discounted_price')
  final int? baseDiscountedPrice;
  final String? unit;
  final int? rating;

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? name,
    String? thumbnailImage,
    int? basePrice,
    int? baseDiscountedPrice,
    String? unit,
    int? rating,
  }) {
    return Product(
      name: name ?? this.name,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      basePrice: basePrice ?? this.basePrice,
      baseDiscountedPrice: baseDiscountedPrice ?? this.baseDiscountedPrice,
      unit: unit ?? this.unit,
      rating: rating ?? this.rating,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      thumbnailImage,
      basePrice,
      baseDiscountedPrice,
      unit,
      rating,
    ];
  }
}
