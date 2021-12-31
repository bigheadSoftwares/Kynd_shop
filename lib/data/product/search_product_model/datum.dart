import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.id,
    this.name,
    this.thumbnailImage,
    this.basePrice,
    this.baseDiscountedPrice,
    this.whatsNew,
    this.combo,
    this.unit,
    this.discount,
    this.discountType,
    this.rating,
    this.sales,
    this.slug,
  });

  final int? id;
  final String? name;
  @JsonKey(name: 'thumbnail_image')
  final String? thumbnailImage;
  @JsonKey(name: 'base_price')
  final int? basePrice;
  @JsonKey(name: 'base_discounted_price')
  final int? baseDiscountedPrice;
  @JsonKey(name: 'whats_new')
  final int? whatsNew;
  final int? combo;
  final String? unit;
  final int? discount;
  @JsonKey(name: 'discount_type')
  final String? discountType;
  final int? rating;
  final int? sales;
  final String? slug;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? name,
    String? thumbnailImage,
    int? basePrice,
    int? baseDiscountedPrice,
    int? whatsNew,
    int? combo,
    String? unit,
    int? discount,
    String? discountType,
    int? rating,
    int? sales,
    String? slug,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      basePrice: basePrice ?? this.basePrice,
      baseDiscountedPrice: baseDiscountedPrice ?? this.baseDiscountedPrice,
      whatsNew: whatsNew ?? this.whatsNew,
      combo: combo ?? this.combo,
      unit: unit ?? this.unit,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      rating: rating ?? this.rating,
      sales: sales ?? this.sales,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      thumbnailImage,
      basePrice,
      baseDiscountedPrice,
      whatsNew,
      combo,
      unit,
      discount,
      discountType,
      rating,
      sales,
      slug,
    ];
  }
}
