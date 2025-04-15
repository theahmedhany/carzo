import 'package:json_annotation/json_annotation.dart';

part 'sell_new_car_request_body.g.dart';

@JsonSerializable()
class SellNewCarRequestBody {
  final List<String> Images;
  final String brand;
  final String Price;
  final String Model;
  final String Condition;
  final String dealership;
  final String Phone;
  final String Location;
  final String Gears;
  final String Year;
  final String FuelEfficiency;
  final String TopSpeed;
  final String OriginCountry;
  final String AssemblyCountry;
  final String Acceleration;
  final String Length;
  final String Width;
  final String Height;
  final String GroundClearance;
  final String Wheelbase;
  final String TrunkSize;
  final String Seats;
  final String Drivetrain;
  final String Fuel;
  final String HorsePower;
  final String Transmission;
  final String Color;

  SellNewCarRequestBody({
    required this.Images,
    required this.brand,
    required this.Price,
    required this.Model,
    required this.Condition,
    required this.dealership,
    required this.Phone,
    required this.Location,
    required this.Gears,
    required this.Year,
    required this.FuelEfficiency,
    required this.TopSpeed,
    required this.OriginCountry,
    required this.AssemblyCountry,
    required this.Acceleration,
    required this.Length,
    required this.Width,
    required this.Height,
    required this.GroundClearance,
    required this.Wheelbase,
    required this.TrunkSize,
    required this.Seats,
    required this.Drivetrain,
    required this.Fuel,
    required this.HorsePower,
    required this.Transmission,
    required this.Color,
  });

  factory SellNewCarRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SellNewCarRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SellNewCarRequestBodyToJson(this);
}
