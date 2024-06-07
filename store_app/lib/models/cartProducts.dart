import 'package:json_annotation/json_annotation.dart';

part 'cartProducts.g.dart';

@JsonSerializable()
class CartProducts {
  CartProducts();

  late num productId;
  late num quantity;
  
  factory CartProducts.fromJson(Map<String,dynamic> json) => _$CartProductsFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductsToJson(this);
}
