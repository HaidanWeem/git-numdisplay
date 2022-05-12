import 'package:json_annotation/json_annotation.dart';

part 'eng.g.dart';

@JsonSerializable()
class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(Map<String, dynamic> json) =>
      _$EngFromJson(json);
}
