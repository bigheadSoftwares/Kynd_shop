import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'my_addresses_model.g.dart';

@JsonSerializable()
class MyAddressesModel extends Equatable {
  const MyAddressesModel({this.data, this.success, this.status});

  final List<AddressDatum>? data;
  final bool? success;
  final int? status;

  factory MyAddressesModel.fromJson(Map<String, dynamic> json) {
    return _$MyAddressesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MyAddressesModelToJson(this);

  MyAddressesModel copyWith({
    List<AddressDatum>? data,
    bool? success,
    int? status,
  }) {
    return MyAddressesModel(
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
