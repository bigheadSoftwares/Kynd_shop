// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str) as Map<String, dynamic>);

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.data,
    this.success,
    this.status,
  });

  List<Datum>? data;
  bool? success;
  int? status;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
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
}

class Datum {
  Datum({
    this.photo,
    this.position,
  });

  String? photo;
  int? position;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        photo: json['photo'] as String,
        position: json['position'] as int,
      );

  Map<String, dynamic> toJson() => {
        'photo': photo,
        'position': position,
      };
}
