import 'package:json_annotation/json_annotation.dart';

part 'jpy.g.dart';

@JsonSerializable()
class Jpy {
  Jpy({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Jpy.fromJson(Map<String, dynamic> json) =>
      _$JpyFromJson(json);
}
