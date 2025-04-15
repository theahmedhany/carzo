import 'package:json_annotation/json_annotation.dart';

part 'sell_personal_car_response.g.dart';

@JsonSerializable()
class SellPersonalCarResponse {
  final String? message;
  final List<String>? errors;
  final int? statusCode;

  SellPersonalCarResponse({this.message, this.errors, this.statusCode});

  factory SellPersonalCarResponse.fromJson(Map<String, dynamic> json) =>
      _$SellPersonalCarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SellPersonalCarResponseToJson(this);
}
