import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  const Links({this.first, this.last});

  final String? first;
  final String? last;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  Links copyWith({
    String? first,
    String? last,
  }) {
    return Links(
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [first, last];
}
