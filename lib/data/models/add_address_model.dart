import 'dart:convert';

class AddAddressModel {
  final int user_id;
  final String address;
  final String country;
  final String city;
  final String postal_code;
  final String phone;
  final int set_default;
  AddAddressModel({
    required this.user_id,
    required this.address,
    required this.country,
    required this.city,
    required this.postal_code,
    required this.phone,
    required this.set_default,
  });

  AddAddressModel copyWith({
    int? user_id,
    String? address,
    String? country,
    String? city,
    String? postal_code,
    String? phone,
    int? set_default,
  }) {
    return AddAddressModel(
      user_id: user_id ?? this.user_id,
      address: address ?? this.address,
      country: country ?? this.country,
      city: city ?? this.city,
      postal_code: postal_code ?? this.postal_code,
      phone: phone ?? this.phone,
      set_default: set_default ?? this.set_default,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory AddAddressModel.fromJson(String source) =>
      AddAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddAddressModel(user_id: $user_id, address: $address, country: $country, city: $city, postal_code: $postal_code, phone: $phone, set_default: $set_default)';
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
        other.set_default == set_default;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
        address.hashCode ^
        country.hashCode ^
        city.hashCode ^
        postal_code.hashCode ^
        phone.hashCode ^
        set_default.hashCode;
  }
}
