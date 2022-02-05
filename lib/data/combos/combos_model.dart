// To parse this JSON data, do
//
//     final combosModel = combosModelFromJson(jsonString);

import 'dart:convert';

CombosModel combosModelFromJson(String str) =>
    CombosModel.fromJson(json.decode(str) as Map<String, dynamic>);

String combosModelToJson(CombosModel data) => json.encode(data.toJson());

class CombosModel {
  CombosModel({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory CombosModel.fromJson(Map<String, dynamic> json) => CombosModel(
        data: List<Datum>.from(
            json['data'].map((x) => Datum.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        success: json['success'] as bool,
        status: json['status'] as int,
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
        'success': success,
        'status': status,
      };
  CombosModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return CombosModel(
      data: data ?? this.data,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.photos,
    this.thumbnailImage,
    this.basePrice,
    this.baseDiscountedPrice,
    this.whatsNew,
    this.unit,
    this.discount,
    this.discountType,
    this.rating,
    this.sales,
    this.slug,
    this.isAddedToCart,
    this.cartQuantity,
    this.isWishlisted,
  });

  final int? id;
  final String? name;
  final List<Map<String, String>>? photos;
  final String? thumbnailImage;
  final int? basePrice;
  final num? baseDiscountedPrice;
  final int? whatsNew;
  final String? unit;
  final int? discount;
  final String? discountType;
  final int? rating;
  final int? sales;
  final String? slug;
  final bool? isAddedToCart;
  final int? cartQuantity;
  final int? isWishlisted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        name: json['name'] as String,
        photos: List<Map<String, String>>.from(json['photos'].map(
          (x) => Map.from(x as Map<dynamic, dynamic>).map((k, v) =>
              MapEntry<String, String>(
                  k as String, v == null ? '' : v as String)),
        ) as Iterable<dynamic>),
        thumbnailImage: json['thumbnail_img'] as String,
        basePrice: json['base_price'] as int,
        baseDiscountedPrice: json['base_discounted_price'] as num,
        whatsNew: json['whats_new'] as int,
        unit: json['unit'] as String,
        discount: json['discount'] as int,
        discountType: json['discount_type'] as String,
        rating: json['rating'] as int,
        sales: json['sales'] as int,
        slug: json['slug'] as String,
        isAddedToCart: json['is_added_to_cart'] as int == 0 ? false : true,
        cartQuantity: json['cart_quantity'] as int,
        isWishlisted: json['is_wishlisted'] as int,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'photos': List<dynamic>.from(
          photos!.map(
            (x) => Map.from(x)
                .map((k, v) => MapEntry<String, dynamic>(k as String, v)),
          ),
        ),
        'thumbnail_image': thumbnailImage,
        'base_price': basePrice,
        'base_discounted_price': baseDiscountedPrice,
        'whats_new': whatsNew,
        'unit': unit,
        'discount': discount,
        'discount_type': discountType,
        'rating': rating,
        'sales': sales,
        'slug': slug,
        'isWishlisted': isWishlisted
      };

  Datum copyWith({
    int? id,
    String? name,
    List<Map<String, String>>? photos,
    String? thumbnailImage,
    int? basePrice,
    num? baseDiscountedPrice,
    int? whatsNew,
    String? unit,
    int? discount,
    String? discountType,
    int? rating,
    int? sales,
    String? slug,
    bool? isAddedToCart,
    int? cartQuantity,
    int? isWishlisted,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      photos: photos ?? this.photos,
      thumbnailImage: thumbnailImage ?? this.thumbnailImage,
      basePrice: basePrice ?? this.basePrice,
      baseDiscountedPrice: baseDiscountedPrice ?? this.baseDiscountedPrice,
      whatsNew: whatsNew ?? this.whatsNew,
      unit: unit ?? this.unit,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      rating: rating ?? this.rating,
      sales: sales ?? this.sales,
      slug: slug ?? this.slug,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      cartQuantity: cartQuantity ?? this.cartQuantity,
      isWishlisted: isWishlisted ?? this.isWishlisted,
    );
  }
}
