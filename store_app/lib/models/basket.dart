import 'package:json_annotation/json_annotation.dart';
import "cartProducts.dart";
part 'basket.g.dart';

@JsonSerializable()
class Basket {
  Basket();

  late num id;
  late num userId;
  late String date;
  late List<CartProducts> products;
  
  factory Basket.fromJson(Map<String,dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);
}
