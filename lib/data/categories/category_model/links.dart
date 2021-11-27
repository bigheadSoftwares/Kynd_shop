import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  const Links({this.products, this.subCategories});

  final String? products;
  @JsonKey(name: 'sub_categories')
  final String? subCategories;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
  Links copyWith({
    String? products,
    String? subCategories,
  }) {
    return Links(
      products: products ?? this.products,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => <Object?>[products, subCategories];
}
