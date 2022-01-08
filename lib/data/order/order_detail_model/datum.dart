import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'shipping_address.dart';

class Datum extends Equatable {
  final ShippingAddress? shippingAddress;
  final int? productId;
  final String? productName;
  final dynamic variation;
  final String? price;
  final String? tax;
  final String? shippingCost;
  final String? couponDiscount;
  final int? quantity;
  final String? paymentStatus;
  final String? paymentStatusString;
  final String? deliveryStatus;
  final String? deliveryStatusString;

  const Datum({
    this.shippingAddress,
    this.productId,
    this.productName,
    this.variation,
    this.price,
    this.tax,
    this.shippingCost,
    this.couponDiscount,
    this.quantity,
    this.paymentStatus,
    this.paymentStatusString,
    this.deliveryStatus,
    this.deliveryStatusString,
  });

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        shippingAddress: data['shipping_address'] == null
            ? null
            : ShippingAddress.fromMap(
                data['shipping_address'] as Map<String, dynamic>),
        productId: data['product_id'] as int?,
        productName: data['product_name'] as String?,
        variation: data['variation'] as dynamic,
        price: data['price'] as String?,
        tax: data['tax'] as String?,
        shippingCost: data['shipping_cost'] as String?,
        couponDiscount: data['coupon_discount'] as String?,
        quantity: data['quantity'] as int?,
        paymentStatus: data['payment_status'] as String?,
        paymentStatusString: data['payment_status_string'] as String?,
        deliveryStatus: data['delivery_status'] as String?,
        deliveryStatusString: data['delivery_status_string'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'shipping_address': shippingAddress?.toMap(),
        'product_id': productId,
        'product_name': productName,
        'variation': variation,
        'price': price,
        'tax': tax,
        'shipping_cost': shippingCost,
        'coupon_discount': couponDiscount,
        'quantity': quantity,
        'payment_status': paymentStatus,
        'payment_status_string': paymentStatusString,
        'delivery_status': deliveryStatus,
        'delivery_status_string': deliveryStatusString,
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
    ShippingAddress? shippingAddress,
    int? productId,
    String? productName,
    dynamic variation,
    String? price,
    String? tax,
    String? shippingCost,
    String? couponDiscount,
    int? quantity,
    String? paymentStatus,
    String? paymentStatusString,
    String? deliveryStatus,
    String? deliveryStatusString,
  }) {
    return Datum(
      shippingAddress: shippingAddress ?? this.shippingAddress,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      variation: variation ?? this.variation,
      price: price ?? this.price,
      tax: tax ?? this.tax,
      shippingCost: shippingCost ?? this.shippingCost,
      couponDiscount: couponDiscount ?? this.couponDiscount,
      quantity: quantity ?? this.quantity,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentStatusString: paymentStatusString ?? this.paymentStatusString,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      deliveryStatusString: deliveryStatusString ?? this.deliveryStatusString,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      shippingAddress,
      productId,
      productName,
      variation,
      price,
      tax,
      shippingCost,
      couponDiscount,
      quantity,
      paymentStatus,
      paymentStatusString,
      deliveryStatus,
      deliveryStatusString,
    ];
  }
}
