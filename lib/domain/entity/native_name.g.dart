// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NativeName _$NativeNameFromJson(Map<String, dynamic> json) => NativeName(
      jpn: json['jpn'] == null
          ? null
          : Translation.fromJson(json['jpn'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NativeNameToJson(NativeName instance) =>
    <String, dynamic>{
      'jpn': instance.jpn,
    };
