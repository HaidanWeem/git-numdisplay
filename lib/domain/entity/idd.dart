import 'package:json_annotation/json_annotation.dart';

part 'idd.g.dart';

@JsonSerializable()
class Idd {
  Idd({
    required this.root,
    required this.suffixes,
  });

  String? root;
  List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) =>
      _$IddFromJson(json);
    
  
}
