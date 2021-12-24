import 'dart:convert';

class AddAddressModel {
  final int? user_id;
  final String? address;
  final String? country;
  final String? city;
  final String? postal_code;
  final String? phone;
  final int? set_default;
  final String? username;
  final double? latitude;
  final double? longitude;
  final String? name_tag;
  AddAddressModel({
    this.user_id,
    this.address,
    this.country,
    this.city,
    this.postal_code,
    this.phone,
    this.set_default,
    this.username,
    this.latitude,
    this.longitude,
    this.name_tag,
  });

  AddAddressModel copyWith({
    int? user_id,
    String? address,
    String? country,
    String? city,
    String? postal_code,
    String? phone,
    int? set_default,
    String? username,
    double? latitude,
    double? longitude,
    String? name_tag,
  }) {
    return AddAddressModel(
      user_id: user_id ?? this.user_id,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      postal_code: postal_code ?? this.postal_code,
      phone: phone ?? this.phone,
      set_default: set_default ?? this.set_default,
      username: username ?? this.username,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name_tag: name_tag ?? this.name_tag,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'address': address,
      'country': country,
      'city': city,
      'postal_code': postal_code,
      'phone': phone,
      'set_default': set_default,
      'username': username,
      'latitude': latitude,
      'longitude': longitude,
      'name_tag': name_tag,
    };
  }

  factory AddAddressModel.fromMap(Map<String, dynamic> map) {
    return AddAddressModel(
      user_id: (map['user_id']?.toInt() ?? 0) as int,
      address: (map['address'] ?? '') as String,
      country: (map['country'] ?? '') as String,
      city: (map['city'] ?? '') as String,
      postal_code: (map['postal_code']?.toInt() ?? 0) as String,
      phone: (map['phone']?.toInt() ?? 0) as String,
      set_default: (map['set_default']?.toInt() ?? 0) as int,
      username: map['username'] as String?,
      latitude: (map['latitude']?.toDouble() ?? 0) as double,
      longitude: (map['longitude']?.toDouble() ?? 0) as double,
      name_tag: map['name_tag'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddAddressModel.fromJson(String source) =>
      AddAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddAddressModel(user_id: $user_id, address: $address, country: $country, city: $city, postal_code: $postal_code, phone: $phone, set_default: $set_default, username: $username, latitude: $latitude, longitude: $longitude, name_tag: $name_tag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddAddressModel &&
        other.user_id == user_id &&
        other.address == address &&
        other.country == country &&
        other.city == city &&
        other.postal_code == postal_code &&
        other.phone == phone &&
        other.set_default == set_default &&
        other.username == username &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.name_tag == name_tag;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
        address.hashCode ^
        country.hashCode ^
        city.hashCode ^
        postal_code.hashCode ^
        phone.hashCode ^
        set_default.hashCode ^
        username.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        name_tag.hashCode;
  }
}
