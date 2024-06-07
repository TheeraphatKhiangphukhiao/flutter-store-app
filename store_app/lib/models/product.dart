import 'package:json_annotation/json_annotation.dart';
import "rating.dart";
part 'product.g.dart';

@JsonSerializable()
class Product {
  Product();

  late num id;
  late String title;
  late num price;
  late String description;
  late String category;
  late String image;
  late Rating rating;
  
  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
