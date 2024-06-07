// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products()
  ..products = (json['products'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'products': instance.products,
    };
