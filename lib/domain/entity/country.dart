import 'package:display_num_phone/domain/entity/currencies.dart';
import 'package:display_num_phone/domain/entity/demonyms.dart';
import 'package:display_num_phone/domain/entity/flags.dart';
import 'package:display_num_phone/domain/entity/idd.dart';
import 'package:display_num_phone/domain/entity/languages.dart';
import 'package:display_num_phone/domain/entity/name.dart';
import 'package:display_num_phone/domain/entity/translations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  Country({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.flag,
    required this.flags,
    required this.demonyms,
  });

  Name name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Map<String, Translation>? translations;
  List<double> latlng;
  bool? landlocked;
  double? area;
  String? flag;
  Flags? flags;
  Demonyms? demonyms;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
