import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  const Links({this.details});

  final String? details;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  Links copyWith({
    String? details,
  }) {
    return Links(
      details: details ?? this.details,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [details];
}
