import 'package:json_annotation/json_annotation.dart';

part 'flags.g.dart';

@JsonSerializable()
class Flags {
  Flags({
    required this.svg,
    required this.png,
  });

  String svg;
  String png;

  factory Flags.fromJson(Map<String, dynamic> json) =>
      _$FlagsFromJson(json);
}
