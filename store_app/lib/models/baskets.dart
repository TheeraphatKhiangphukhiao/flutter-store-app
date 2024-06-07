import 'package:json_annotation/json_annotation.dart';
import "basket.dart";
part 'baskets.g.dart';

@JsonSerializable()
class Baskets {
  Baskets();

  late List<Basket> baskets;
  
  factory Baskets.fromJson(Map<String,dynamic> json) => _$BasketsFromJson(json);
  Map<String, dynamic> toJson() => _$BasketsToJson(this);
}
