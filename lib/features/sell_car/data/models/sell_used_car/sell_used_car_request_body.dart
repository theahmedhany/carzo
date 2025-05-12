import 'package:json_annotation/json_annotation.dart';

part 'sell_used_car_request_body.g.dart';

@JsonSerializable()
class SellUsedCarRequestBody {
  final List<String> Images;
  final String brand;
  final String Price;
  final String Model;
  final String Condition;
  final String FuelType;
  final String Transmission;
  final String Color;
  final String ManufacturingYear;
  final String Mileage;
  final String Description;
  final String dealership;
  final String Phone;
  final String Location;
  final String City;

  SellUsedCarRequestBody({
    required this.Images,
    required this.FuelType,
    required this.Mileage,
    required this.Description,
    required this.City,
    required this.brand,
    required this.Price,
    required this.Model,
    required this.Condition,
    required this.dealership,
    required this.Phone,
    required this.Location,
    required this.ManufacturingYear,
    required this.Transmission,
    required this.Color,
  });

  factory SellUsedCarRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SellUsedCarRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SellUsedCarRequestBodyToJson(this);
}
