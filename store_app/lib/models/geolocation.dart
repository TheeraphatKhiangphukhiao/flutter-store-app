import 'package:json_annotation/json_annotation.dart';

part 'geolocation.g.dart';

@JsonSerializable()
class Geolocation {
  Geolocation();

  late String lat;
  late String long;
  
  factory Geolocation.fromJson(Map<String,dynamic> json) => _$GeolocationFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocationToJson(this);
}
