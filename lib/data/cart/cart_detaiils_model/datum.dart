import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'product.dart';

class Datum extends Equatable {
  final int? id;
  final Product? product;
  final int? price;
  final int? tax;
  final int? shippingCost;
  final int? quantity;
  final String? date;

  const Datum({
    this.id,
    this.product,
    this.price,
    this.tax,
    this.shippingCost,
    this.quantity,
    this.date,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        product: data['product'] == null
            ? null
            : Product.fromMap(data['product'] as Map<String, dynamic>),
        price: data['price'] as int?,
        tax: data['tax'] as int?,
        shippingCost: data['shipping_cost'] as int?,
        quantity: data['quantity'] as int?,
        date: data['date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'product': product?.toMap(),
        'price': price,
        'tax': tax,
        'shipping_cost': shippingCost,
        'quantity': quantity,
        'date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());

  Datum copyWith({
    int? id,
    Product? product,
    int? price,
    int? tax,
    int? shippingCost,
    int? quantity,
    String? date,
  }) {
    return Datum(
      id: id ?? this.id,
      product: product ?? this.product,
      price: price ?? this.price,
      tax: tax ?? this.tax,
      shippingCost: shippingCost ?? this.shippingCost,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      product,
      price,
      tax,
      shippingCost,
      quantity,
      date,
    ];
  }
}
