import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? image;

  const Product({this.name, this.image});

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());

  Product copyWith({
    String? name,
    String? image,
  }) {
    return Product(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, image];
}
