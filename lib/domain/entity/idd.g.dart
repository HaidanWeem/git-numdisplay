// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idd.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Idd _$IddFromJson(Map<String, dynamic> json) => Idd(
      root: json['root'] as String?,
      suffixes: (json['suffixes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$IddToJson(Idd instance) => <String, dynamic>{
      'root': instance.root,
      'suffixes': instance.suffixes,
    };
