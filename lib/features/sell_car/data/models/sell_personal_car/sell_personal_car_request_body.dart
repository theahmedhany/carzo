import 'package:json_annotation/json_annotation.dart';

part 'sell_personal_car_request_body.g.dart';

@JsonSerializable()
class SellPersonalCarRequestBody {
  final List<String> Images;
  final String brand;
  final String Model;
  final String YearOfManufacture;
  final String Kilometers;
  final String Transmission;
  final String FuelType;
  final String Color;
  final String Description;
  final String Price;
  final String Address;
  final String Location;
  final String SellerEmail;
  final String ContactInfo;
  final String TypeOfPlan;
  final String PriceOfPlan;
  final String AppUserId;

  SellPersonalCarRequestBody({
    required this.Images,
    required this.FuelType,
    required this.Description,
    required this.brand,
    required this.Price,
    required this.Model,
    required this.Location,
    required this.Transmission,
    required this.Color,
    required this.YearOfManufacture,
    required this.Kilometers,
    required this.Address,
    required this.SellerEmail,
    required this.ContactInfo,
    required this.TypeOfPlan,
    required this.PriceOfPlan,
    required this.AppUserId,
  });

  factory SellPersonalCarRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SellPersonalCarRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SellPersonalCarRequestBodyToJson(this);
}
