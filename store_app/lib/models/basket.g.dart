// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Basket _$BasketFromJson(Map<String, dynamic> json) => Basket()
  ..id = json['id'] as num
  ..userId = json['userId'] as num
  ..date = json['date'] as String
  ..products = (json['products'] as List<dynamic>)
      .map((e) => CartProducts.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BasketToJson(Basket instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date,
      'products': instance.products,
    };
