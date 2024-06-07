// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baskets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Baskets _$BasketsFromJson(Map<String, dynamic> json) => Baskets()
  ..baskets = (json['baskets'] as List<dynamic>)
      .map((e) => Basket.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$BasketsToJson(Baskets instance) => <String, dynamic>{
      'baskets': instance.baskets,
    };
