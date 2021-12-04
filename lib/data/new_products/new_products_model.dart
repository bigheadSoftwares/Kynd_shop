// To parse this JSON data, do
//
//     final newProductsModel = newProductsModelFromJson(jsonString);

import 'dart:convert';

NewProductsModel newProductsModelFromJson(String str) =>
    NewProductsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String newProductsModelToJson(NewProductsModel data) =>
    json.encode(data.toJson());

class NewProductsModel {
  NewProductsModel({
    this.data,
    this.success,
    this.status,
  });

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory NewProductsModel.fromJson(Map<String, dynamic> json) =>
      NewProductsModel(
        data: json['data'] == null
            ? null
            : List<Datum>.from(json['data']
                    .map((x) => Datum.fromJson(x as Map<String, dynamic>))
                as Iterable<dynamic>),
        success: json['success'] == null ? null : json['success'] as bool,
        status: json['status'] == null ? null : json['status'] as int,
      );

  Map<String, dynamic> toJson() => {
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
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
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'].toString(),
        photos: json['photos'] == null
            ? null
            : List<Map<String, String>>.from(json['photos'].map(
                (x) => Map.from(x as Map<dynamic, dynamic>).map(
                  (k, v) => MapEntry<String, String>(k as String, v as String),
                ),
              ) as Iterable<dynamic>),
        thumbnailImage: json['thumbnail_image'] == null
            ? null
            : json['thumbnail_image'] as String,
        basePrice:
            json['base_price'] == null ? null : json['base_price'] as int,
        baseDiscountedPrice: json['base_discounted_price'] == null
            ? null
            : json['base_discounted_price'] as int,
        whatsNew: json['whats_new'] == null ? null : json['whats_new'] as int,
        unit: json['unit'] == null ? null : json['unit'] as String,
        discount: json['discount'] == null ? null : json['discount'] as int,
        discountType: json['discount_type'] == null
            ? null
            : json['discount_type'] as String,
        rating: json['rating'] == null ? null : json['rating'] as int,
        sales: json['sales'] == null ? null : json['sales'] as int,
        slug: json['slug'] == null ? null : json['slug'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'photos': photos == null
            ? null
            : List<dynamic>.from(photos!.map((x) => Map.from(x)
                .map((k, v) => MapEntry<String, dynamic>(k as String, v)))),
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
