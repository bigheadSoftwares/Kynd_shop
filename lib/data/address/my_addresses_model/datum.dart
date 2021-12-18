import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.id,
    this.userId,
    this.address,
    this.country,
    this.city,
    this.postalCode,
    this.phone,
    this.setDefault,
  });

  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? address;
  final String? country;
  final String? city;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  final String? phone;
  @JsonKey(name: 'set_default')
  final int? setDefault;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    int? userId,
    String? address,
    String? country,
    String? city,
    String? postalCode,
    String? phone,
    int? setDefault,
  }) {
    return Datum(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      phone: phone ?? this.phone,
      setDefault: setDefault ?? this.setDefault,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      address,
      country,
      city,
      postalCode,
      phone,
      setDefault,
    ];
  }
}
