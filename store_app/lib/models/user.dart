import 'package:json_annotation/json_annotation.dart';
import "address.dart";
import "name.dart";
part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late Address address;
  late num id;
  late String email;
  late String username;
  late String password;
  late Name name;
  late String phone;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
