import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
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

  @JsonKey(name: 'shipping_address')
  final String? shippingAddress;
  @JsonKey(name: 'product_id')
  final int? productId;
  @JsonKey(name: 'product_name')
  final String? productName;
  final dynamic variation;
  final String? price;
  final String? tax;
  @JsonKey(name: 'shipping_cost')
  final String? shippingCost;
  @JsonKey(name: 'coupon_discount')
  final String? couponDiscount;
  final int? quantity;
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @JsonKey(name: 'payment_status_string')
  final String? paymentStatusString;
  @JsonKey(name: 'delivery_status')
  final String? deliveryStatus;
  @JsonKey(name: 'delivery_status_string')
  final String? deliveryStatusString;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    String? shippingAddress,
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
