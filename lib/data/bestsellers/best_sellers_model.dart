// To parse this JSON data, do
//
//     final bestSellersModel = bestSellersModelFromJson(jsonString);

import 'dart:convert';

BestSellersModel bestSellersModelFromJson(String str) =>
    BestSellersModel.fromJson(json.decode(str) as Map<String, dynamic>);

String bestSellersModelToJson(BestSellersModel data) =>
    json.encode(data.toJson());

class BestSellersModel {
  BestSellersModel({
    this.data,
    this.success,
    this.status,
  });

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory BestSellersModel.fromJson(Map<String, dynamic> json) =>
      BestSellersModel(
        data: List<Datum>.from(json['data']
                .map((dynamic x) => Datum.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
        success: json['success'] as bool,
        status: json['status'] as int,
      );

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
        'success': success,
        'status': status,
      };
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
  });

  final int? id;
  final String? name;
  final List<Map<String, String>>? photos;
  final String? thumbnailImage;
  final int? basePrice;
  final int? baseDiscountedPrice;
  final int? whatsNew;
  final String? unit;
  final int? discount;
  final String? discountType;
  final int? rating;
  final int? sales;
  final String? slug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int,
        name: json['name'] as String,
        photos: List<Map<String, String>>.from(json['photos'].map(
          (x) => Map.from(x as Map<dynamic, dynamic>).map(
              (k, v) => MapEntry<String, String>(k as String, v as String)),
        ) as Iterable<dynamic>),
        thumbnailImage: json['thumbnail_image'] as String,
        basePrice: json['base_price'] as int,
        baseDiscountedPrice: json['base_discounted_price'] as int,
        whatsNew: json['whats_new'] as int,
        unit: json['unit'] as String,
        discount: json['discount'] as int,
        discountType: json['discount_type'] as String,
        rating: json['rating'] as int,
        sales: json['sales'] as int,
        slug: json['slug'] as String,
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
      };
}
