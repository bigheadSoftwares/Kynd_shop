part of 'user_repository.dart';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    this.referredBy,
    this.providerId,
    required this.userType,
    required this.name,
    this.email,
    this.emailVerifiedAt,
    this.avatar,
    this.avatarOriginal,
    this.address,
    this.country,
    this.city,
    this.postalCode,
    required this.phone,
    this.balance,
    this.banned,
    this.referralCode,
    this.remainingUploads,
    this.charity,
  });

  int id;
  String? referredBy;
  int? providerId;
  String userType;
  String name;
  String? email;
  String? emailVerifiedAt;
  String? avatar;
  String? avatarOriginal;
  String? address;
  String? country;
  String? city;
  dynamic postalCode;
  String phone;
  num? balance;
  num? banned;
  String? referralCode;
  int? remainingUploads;
  String? charity;

  UserModel copyWith({
    int? id,
    String? referredBy,
    int? providerId,
    String? userType,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? avatar,
    String? avatarOriginal,
    String? address,
    String? country,
    String? city,
    dynamic postalCode,
    String? phone,
    num? balance,
    num? banned,
    String? referralCode,
    int? remainingUploads,
    String? charity,
  }) =>
      UserModel(
        id: id ?? this.id,
        referredBy: referredBy ?? this.referredBy,
        providerId: providerId ?? this.providerId,
        userType: userType ?? this.userType,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        avatar: avatar ?? this.avatar,
        avatarOriginal: avatarOriginal ?? this.avatarOriginal,
        address: address ?? this.address,
        country: country ?? this.country,
        city: city ?? this.city,
        postalCode: postalCode ?? this.postalCode,
        phone: phone ?? this.phone,
        balance: balance ?? this.balance,
        banned: banned ?? this.banned,
        referralCode: referralCode ?? this.referralCode,
        remainingUploads: remainingUploads ?? this.remainingUploads,
        charity: charity ?? this.charity,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] == null ? 1 : json['id'] as int,
        referredBy:
            json['referred_by'] == null ? null : json['referred_by'] as String,
        providerId:
            json['provider_id'] == null ? null : json['provider_id'] as int,
        userType: json['user_type'] as String,
        name: json['name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        emailVerifiedAt: json['email_verified_at'] == null
            ? null
            : json['email_verified_at'] as String,
        avatar: json['avatar'] == null ? null : json['avatar'] as String,
        avatarOriginal: json['avatar_original'] == null
            ? null
            : json['avatar_original'] as String,
        address: json['address'] == null ? null : json['address'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        postalCode: json['postal_code'],
        phone: json['phone'] as String,
        balance: json['balance'] == null ? null : json['balance'] as num,
        banned: json['banned'] == null ? null : json['banned'] as num,
        referralCode: json['referral_code'] == null
            ? null
            : json['referral_code'] as String,
        remainingUploads: json['remaining_uploads'] == null
            ? null
            : json['remaining_uploads'] as int,
        charity: json['charity'] == null ? null : json['charity'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'referred_by': referredBy,
        'provider_id': providerId,
        'user_type': userType,
        'name': name,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'avatar': avatar,
        'avatar_original': avatarOriginal,
        'address': address,
        'country': country,
        'city': city,
        'postal_code': postalCode,
        'phone': phone,
        'balance': balance,
        'banned': banned,
        'referral_code': referralCode,
        'remaining_uploads': remainingUploads,
        'charity': charity,
      };
}
