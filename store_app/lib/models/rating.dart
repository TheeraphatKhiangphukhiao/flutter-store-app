import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  Rating();

  late num rate;
  late num count;
  
  factory Rating.fromJson(Map<String,dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
