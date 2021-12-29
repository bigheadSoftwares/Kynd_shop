import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.id,
    this.product,
    this.isWishlisted,
  });

  final int? id;
  final Product? product;
  final int? isWishlisted;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    Product? product,
    int? isWishlisted,
  }) {
    return Datum(
      id: id ?? this.id,
      product: product ?? this.product,
      isWishlisted: isWishlisted ?? this.isWishlisted,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, product, isWishlisted];
}
