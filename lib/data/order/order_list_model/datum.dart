import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'shipping_address.dart';
import 'user.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.code,
    this.id,
    this.user,
    this.shippingAddress,
    this.paymentType,
    this.paymentStatus,
    this.grandTotal,
    this.couponDiscount,
    this.shippingCost,
    this.subtotal,
    this.tax,
    this.date,
    this.deliveryStatus,
    this.deliveryStatusString,
    this.links,
  });

  final String? code;
  final int? id;
  final User? user;
  @JsonKey(name: 'shipping_address')
  final ShippingAddress? shippingAddress;
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @JsonKey(name: 'grand_total')
  final int? grandTotal;
  @JsonKey(name: 'coupon_discount')
  final int? couponDiscount;
  @JsonKey(name: 'shipping_cost')
  final int? shippingCost;
  final int? subtotal;
  final int? tax;
  final String? date;
  @JsonKey(name: 'delivery_status')
  final String? deliveryStatus;
  @JsonKey(name: 'delivery_status_string')
  final String? deliveryStatusString;
  final Links? links;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    String? code,
    int? id,
    User? user,
    ShippingAddress? shippingAddress,
    String? paymentType,
    String? paymentStatus,
    int? grandTotal,
    int? couponDiscount,
    int? shippingCost,
    int? subtotal,
    int? tax,
    String? date,
    String? deliveryStatus,
    String? deliveryStatusString,
    Links? links,
  }) {
    return Datum(
      code: code ?? this.code,
      id: id ?? this.id,
      user: user ?? this.user,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      paymentType: paymentType ?? this.paymentType,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      grandTotal: grandTotal ?? this.grandTotal,
      couponDiscount: couponDiscount ?? this.couponDiscount,
      shippingCost: shippingCost ?? this.shippingCost,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      date: date ?? this.date,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      deliveryStatusString: deliveryStatusString ?? this.deliveryStatusString,
      links: links ?? this.links,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      code,
      id,
      user,
      shippingAddress,
      paymentType,
      paymentStatus,
      grandTotal,
      couponDiscount,
      shippingCost,
      subtotal,
      tax,
      date,
      deliveryStatus,
      deliveryStatusString,
      links,
    ];
  }
}
