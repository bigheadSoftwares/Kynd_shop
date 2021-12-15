import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({this.name, this.email, this.avatar, this.avatarOriginal});

  final String? name;
  final dynamic email;
  final dynamic avatar;
  @JsonKey(name: 'avatar_original')
  final String? avatarOriginal;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? name,
    dynamic email,
    dynamic avatar,
    String? avatarOriginal,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      avatarOriginal: avatarOriginal ?? this.avatarOriginal,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, email, avatar, avatarOriginal];
}
