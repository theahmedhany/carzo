import 'package:json_annotation/json_annotation.dart';

part 'sell_new_car_response.g.dart';

@JsonSerializable()
class SellNewCarResponse {
  final String? message;
  final List<String>? errors;
  final int? statusCode;

  SellNewCarResponse({this.message, this.errors, this.statusCode});

  factory SellNewCarResponse.fromJson(Map<String, dynamic> json) =>
      _$SellNewCarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SellNewCarResponseToJson(this);
}
