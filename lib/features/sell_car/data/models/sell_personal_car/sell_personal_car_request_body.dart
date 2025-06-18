import 'package:json_annotation/json_annotation.dart';

part 'sell_personal_car_request_body.g.dart';

@JsonSerializable()
class SellPersonalCarRequestBody {
  final List<String> Image;
  final String brand;
  final String model;
  final String ManufacturingYear;
  final String Mileage;
  final String Transmission;
  final String FuelType;
  final String Color;
  final String Description;
  final String Price;
  final String City;
  final String Location;
  final String SellerEmail;
  final String ContactInfo;
  final String TypeOfPlan;
  final String AppUserId;

  SellPersonalCarRequestBody({
    required this.Image,
    required this.FuelType,
    required this.Description,
    required this.brand,
    required this.Price,
    required this.model,
    required this.Location,
    required this.Transmission,
    required this.Color,
    required this.ManufacturingYear,
    required this.Mileage,
    required this.City,
    required this.SellerEmail,
    required this.ContactInfo,
    required this.TypeOfPlan,
    required this.AppUserId,
  });

  factory SellPersonalCarRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SellPersonalCarRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SellPersonalCarRequestBodyToJson(this);
}
