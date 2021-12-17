import 'dart:convert';

import 'package:equatable/equatable.dart';

class CartSummaryModel extends Equatable {
  final String? subTotal;
  final String? tax;
  final String? shippingCost;
  final String? discount;
  final String? grandTotal;
  final int? grandTotalValue;
  final String? couponCode;
  final bool? couponApplied;

  const CartSummaryModel({
    this.subTotal,
    this.tax,
    this.shippingCost,
    this.discount,
    this.grandTotal,
    this.grandTotalValue,
    this.couponCode,
    this.couponApplied,
  });

  factory CartSummaryModel.fromMap(Map<String, dynamic> data) =>
      CartSummaryModel(
        subTotal: data['sub_total'] as String?,
        tax: data['tax'] as String?,
        shippingCost: data['shipping_cost'] as String?,
        discount: data['discount'] as String?,
        grandTotal: data['grand_total'] as String?,
        grandTotalValue: data['grand_total_value'] as int?,
        couponCode: data['coupon_code'] as String?,
        couponApplied: data['coupon_applied'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'sub_total': subTotal,
        'tax': tax,
        'shipping_cost': shippingCost,
        'discount': discount,
        'grand_total': grandTotal,
        'grand_total_value': grandTotalValue,
        'coupon_code': couponCode,
        'coupon_applied': couponApplied,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CartSummaryModel].
  factory CartSummaryModel.fromJson(String data) {
    return CartSummaryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CartSummaryModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CartSummaryModel copyWith({
    String? subTotal,
    String? tax,
    String? shippingCost,
    String? discount,
    String? grandTotal,
    int? grandTotalValue,
    String? couponCode,
    bool? couponApplied,
  }) {
    return CartSummaryModel(
      subTotal: subTotal ?? this.subTotal,
      tax: tax ?? this.tax,
      shippingCost: shippingCost ?? this.shippingCost,
      discount: discount ?? this.discount,
      grandTotal: grandTotal ?? this.grandTotal,
      grandTotalValue: grandTotalValue ?? this.grandTotalValue,
      couponCode: couponCode ?? this.couponCode,
      couponApplied: couponApplied ?? this.couponApplied,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      subTotal,
      tax,
      shippingCost,
      discount,
      grandTotal,
      grandTotalValue,
      couponCode,
      couponApplied,
    ];
  }
}
