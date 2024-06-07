import 'package:json_annotation/json_annotation.dart';
import "geolocation.dart";
part 'address.g.dart';

@JsonSerializable()
class Address {
  Address();

  late Geolocation geolocation;
  late String city;
  late String street;
  late num number;
  late String zipcode;
  
  factory Address.fromJson(Map<String,dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
