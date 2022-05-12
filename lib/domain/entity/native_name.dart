import 'package:display_num_phone/domain/entity/translations.dart';
import 'package:json_annotation/json_annotation.dart';
part 'native_name.g.dart';

@JsonSerializable()
class NativeName {
  NativeName({
    required this.jpn,
  });

  Translation? jpn;

  factory NativeName.fromJson(Map<String, dynamic> json) =>
      _$NativeNameFromJson(json);
}
