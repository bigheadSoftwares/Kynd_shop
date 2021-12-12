import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax.g.dart';

@JsonSerializable()
class Tax extends Equatable {
  const Tax({
    this.id,
    this.productId,
    this.taxId,
    this.tax,
    this.taxType,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  @JsonKey(name: 'product_id')
  final int? productId;
  @JsonKey(name: 'tax_id')
  final int? taxId;
  final int? tax;
  @JsonKey(name: 'tax_type')
  final String? taxType;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);

  Tax copyWith({
    int? id,
    int? productId,
    int? taxId,
    int? tax,
    String? taxType,
    String? createdAt,
    String? updatedAt,
  }) {
    return Tax(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      taxId: taxId ?? this.taxId,
      tax: tax ?? this.tax,
      taxType: taxType ?? this.taxType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      taxId,
      tax,
      taxType,
      createdAt,
      updatedAt,
    ];
  }
}
