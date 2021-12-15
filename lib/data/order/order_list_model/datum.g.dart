// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      productId: json['product_id'] as int?,
      productName: json['product_name'] as String?,
      variation: json['variation'],
      price: json['price'] as String?,
      tax: json['tax'] as String?,
      shippingCost: json['shipping_cost'] as String?,
      couponDiscount: json['coupon_discount'] as String?,
      quantity: json['quantity'] as int?,
      paymentStatus: json['payment_status'] as String?,
      paymentStatusString: json['payment_status_string'] as String?,
      deliveryStatus: json['delivery_status'] as String?,
      deliveryStatusString: json['delivery_status_string'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'variation': instance.variation,
      'price': instance.price,
      'tax': instance.tax,
      'shipping_cost': instance.shippingCost,
      'coupon_discount': instance.couponDiscount,
      'quantity': instance.quantity,
      'payment_status': instance.paymentStatus,
      'payment_status_string': instance.paymentStatusString,
      'delivery_status': instance.deliveryStatus,
      'delivery_status_string': instance.deliveryStatusString,
    };
