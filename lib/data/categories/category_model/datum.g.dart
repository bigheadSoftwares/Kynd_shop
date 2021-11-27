// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      banner: json['banner'] as String?,
      icon: json['icon'] as String?,
      numberOfChildren: json['number_of_children'] as int?,
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'banner': instance.banner,
      'icon': instance.icon,
      'number_of_children': instance.numberOfChildren,
      'links': instance.links,
    };
