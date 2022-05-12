import 'package:display_num_phone/domain/entity/native_name.dart';
import 'package:json_annotation/json_annotation.dart';
part 'name.g.dart';

@JsonSerializable()
class Name {
  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  String? common;
  String? official;
  NativeName? nativeName;

   factory Name.fromJson(Map<String, dynamic> json) =>
      _$NameFromJson(json);
}
