import 'package:json_annotation/json_annotation.dart';
import "product.dart";
part 'products.g.dart';

@JsonSerializable()
class Products {
  Products();

  late List<Product> products;
  
  factory Products.fromJson(Map<String,dynamic> json) => _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
