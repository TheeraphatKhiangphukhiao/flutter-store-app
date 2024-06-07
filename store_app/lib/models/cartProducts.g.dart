// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartProducts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProducts _$CartProductsFromJson(Map<String, dynamic> json) => CartProducts()
  ..productId = json['productId'] as num
  ..quantity = json['quantity'] as num;

Map<String, dynamic> _$CartProductsToJson(CartProducts instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
