// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..address = Address.fromJson(json['address'] as Map<String, dynamic>)
  ..id = json['id'] as num
  ..email = json['email'] as String
  ..username = json['username'] as String
  ..password = json['password'] as String
  ..name = Name.fromJson(json['name'] as Map<String, dynamic>)
  ..phone = json['phone'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
    };
