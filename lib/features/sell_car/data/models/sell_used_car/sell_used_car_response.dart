import 'package:json_annotation/json_annotation.dart';

part 'sell_used_car_response.g.dart';

@JsonSerializable()
class SellUsedCarResponse {
  final String? message;
  final List<String>? errors;
  final int? statusCode;

  SellUsedCarResponse({this.message, this.errors, this.statusCode});

  factory SellUsedCarResponse.fromJson(Map<String, dynamic> json) =>
      _$SellUsedCarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SellUsedCarResponseToJson(this);
}
