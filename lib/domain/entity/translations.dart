import 'package:json_annotation/json_annotation.dart';

part 'translations.g.dart';

@JsonSerializable()
class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(Map<String, dynamic> json) =>
      _$TranslationFromJson(json);
}
