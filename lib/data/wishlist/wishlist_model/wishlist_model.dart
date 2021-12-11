import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'wishlist_model.g.dart';

@JsonSerializable()
class WishlistModel extends Equatable {
  const WishlistModel({this.data, this.success, this.status});

  final List<Datum>? data;
  final bool? success;
  final int? status;

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return _$WishlistModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WishlistModelToJson(this);

  WishlistModel copyWith({
    List<Datum>? data,
    bool? success,
    int? status,
  }) {
    return WishlistModel(
      data: data ?? this.data,
      success: success ?? this.success,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [data, success, status];
}
