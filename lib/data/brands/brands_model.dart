part of 'brands_repo.dart';

BrandsModel brandsModelFromJson(String str) =>
    BrandsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String brandsModelToJson(BrandsModel data) => json.encode(data.toJson());

class BrandsModel {
  BrandsModel({
    required this.data,
    required this.success,
    required this.status,
  });

  List<Brands> data;
  bool success;
  int status;

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
        data: List<Brands>.from((json['data'] as Iterable<dynamic>)
            .map((dynamic x) => Brands.fromJson(x as Map<String, dynamic>))),
        success: json['success'] as bool,
        status: json['status'] as int,
      );

  Map<String, dynamic> toJson() => <String,dynamic>{
        'data': List<dynamic>.from(data.map((dynamic x) => x.toJson())),
        'success': success,
        'status': status,
      };
}

class Brands {
  Brands({
    required this.name,
    required this.logo,
  });

  String name;
  String logo;

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        name: json['name'] as String,
        logo: json['logo'] as String,
      );

  Map<String, dynamic> toJson() => <String,dynamic>{
        'name': name,
        'logo': logo,
      };
}
