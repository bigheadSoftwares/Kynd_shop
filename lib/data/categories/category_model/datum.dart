import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.id,
    this.name,
    this.banner,
    this.icon,
    this.numberOfChildren,
  });

  final int? id;
  final String? name;
  final String? banner;
  final String? icon;
  @JsonKey(name: 'number_of_children')
  final int? numberOfChildren;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
  Datum copyWith({
    int? id,
    String? name,
    String? banner,
    String? icon,
    int? numberOfChildren,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      icon: icon ?? this.icon,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return <Object?>[
      id,
      name,
      banner,
      icon,
      numberOfChildren,
    ];
  }
}
