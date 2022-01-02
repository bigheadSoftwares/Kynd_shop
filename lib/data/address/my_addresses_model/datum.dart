import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class AddressDatum extends Equatable {
  const AddressDatum({
    this.id,
    this.userId,
    this.address,
    this.country,
    this.city,
    this.postalCode,
    this.phone,
    this.setDefault,
    this.username,
    this.nameTag,
    this.latitude,
    this.longitude,
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
  final String? username;
  @JsonKey(name: 'name_tag')
  final String? nameTag;
  final double? latitude;
  final double? longitude;

  factory AddressDatum.fromJson(Map<String, dynamic> json) =>
      _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  AddressDatum copyWith({
    int? id,
    int? userId,
    String? address,
    String? country,
    String? city,
    String? postalCode,
    String? phone,
    int? setDefault,
    String? username,
    String? nameTag,
    double? latitude,
    double? longitude,
  }) {
    return AddressDatum(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      phone: phone ?? this.phone,
      setDefault: setDefault ?? this.setDefault,
      username: username ?? this.username,
      nameTag: nameTag ?? this.nameTag,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
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
      username,
      nameTag,
      latitude,
      longitude,
    ];
  }
}
