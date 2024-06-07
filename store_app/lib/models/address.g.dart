// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address()
  ..geolocation =
      Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>)
  ..city = json['city'] as String
  ..street = json['street'] as String
  ..number = json['number'] as num
  ..zipcode = json['zipcode'] as String;

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'geolocation': instance.geolocation,
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };
