// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      code: json['code'] as String?,
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      shippingAddress: json['shipping_address'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shipping_address'] as Map<String, dynamic>),
      paymentType: json['payment_type'] as String?,
      paymentStatus: json['payment_status'] as String?,
      grandTotal: json['grand_total'] as int?,
      couponDiscount: json['coupon_discount'] as int?,
      shippingCost: json['shipping_cost'] as int?,
      subtotal: json['subtotal'] as int?,
      tax: json['tax'] as int?,
      date: json['date'] as String?,
      deliveryStatus: json['delivery_status'] as String?,
      deliveryStatusString: json['delivery_status_string'] as String?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'user': instance.user,
      'shipping_address': instance.shippingAddress,
      'payment_type': instance.paymentType,
      'payment_status': instance.paymentStatus,
      'grand_total': instance.grandTotal,
      'coupon_discount': instance.couponDiscount,
      'shipping_cost': instance.shippingCost,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'date': instance.date,
      'delivery_status': instance.deliveryStatus,
      'delivery_status_string': instance.deliveryStatusString,
      'links': instance.links,
    };
