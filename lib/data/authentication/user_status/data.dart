import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user_details.dart';

class Data extends Equatable {
  final UserDetails? userDetails;
  final String? referralCode;
  final double? balance;
  final String? charity;
  final int? isFirstOrder;

  const Data({
    this.userDetails,
    this.referralCode,
    this.balance,
    this.charity,
    this.isFirstOrder,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        userDetails: data['user_details'] == null
            ? null
            : UserDetails.fromMap(data['user_details'] as Map<String, dynamic>),
        referralCode: data['referral_code'] as String?,
        balance: (data['balance'] as num?)?.toDouble(),
        charity: data['charity'] as String?,
        isFirstOrder: data['is_first_order'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'user_details': userDetails?.toMap(),
        'referral_code': referralCode,
        'balance': balance,
        'charity': charity,
        'is_first_order': isFirstOrder,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());

  Data copyWith({
    UserDetails? userDetails,
    String? referralCode,
    double? balance,
    String? charity,
    int? isFirstOrder,
  }) {
    return Data(
      userDetails: userDetails ?? this.userDetails,
      referralCode: referralCode ?? this.referralCode,
      balance: balance ?? this.balance,
      charity: charity ?? this.charity,
      isFirstOrder: isFirstOrder ?? this.isFirstOrder,
    );
  }

  @override
  List<Object?> get props {
    return [
      userDetails,
      referralCode,
      balance,
      charity,
      isFirstOrder,
    ];
  }
}
