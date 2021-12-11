import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  const Category({this.name, this.banner, this.icon});

  final String? name;
  final String? banner;
  final String? icon;

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    String? name,
    String? banner,
    String? icon,
  }) {
    return Category(
      name: name ?? this.name,
      banner: banner ?? this.banner,
      icon: icon ?? this.icon,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, banner, icon];
}
