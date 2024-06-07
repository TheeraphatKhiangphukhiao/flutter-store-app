import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class Name {
  Name();

  late String firstname;
  late String lastname;
  
  factory Name.fromJson(Map<String,dynamic> json) => _$NameFromJson(json);
  Map<String, dynamic> toJson() => _$NameToJson(this);
}
