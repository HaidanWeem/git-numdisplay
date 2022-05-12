// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demonyms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Demonyms _$DemonymsFromJson(Map<String, dynamic> json) => Demonyms(
      eng: Eng.fromJson(json['eng'] as Map<String, dynamic>),
      fra: json['fra'] == null
          ? null
          : Eng.fromJson(json['fra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DemonymsToJson(Demonyms instance) => <String, dynamic>{
      'eng': instance.eng,
      'fra': instance.fra,
    };
