import 'package:display_num_phone/domain/entity/jpy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currencies.g.dart';

@JsonSerializable()
class Currencies {
  Currencies({
    required this.jpy,
  });

  Jpy? jpy;

    factory Currencies.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesFromJson(json);
}
