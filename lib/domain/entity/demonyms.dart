import 'package:display_num_phone/domain/entity/eng.dart';
import 'package:json_annotation/json_annotation.dart';
part 'demonyms.g.dart';

@JsonSerializable()
class Demonyms {
  Demonyms({
    required this.eng,
    required this.fra,
  });

  Eng eng;
  Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) =>
      _$DemonymsFromJson(json);
}
