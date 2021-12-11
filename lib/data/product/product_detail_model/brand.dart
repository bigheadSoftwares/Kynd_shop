import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand extends Equatable {
  const Brand({this.name, this.logo});

  final String? name;
  final String? logo;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);

  Brand copyWith({
    String? name,
    String? logo,
  }) {
    return Brand(
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, logo];
}
