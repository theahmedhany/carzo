import 'package:json_annotation/json_annotation.dart';

part 'car_details_model.g.dart';

@JsonSerializable()
class CarDetailsModel {
  int? id;
  String? carName;
  String? status;
  int? price;
  String? condition;
  String? dealershipName;
  String? brand;
  String? model;
  Specifications? specifications;
  List<Url>? url;
  String? phone;
  String? location;
  String? dealershipImg;

  CarDetailsModel({
    this.id,
    this.carName,
    this.status,
    this.price,
    this.condition,
    this.dealershipName,
    this.brand,
    this.model,
    this.specifications,
    this.url,
    this.phone,
    this.location,
  });

  factory CarDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CarDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarDetailsModelToJson(this);
}

@JsonSerializable()
class Specifications {
  String? city;
  String? fuel;
  String? transmission;
  String? color;
  int? year;
  String? description;
  int? mileage;
  int? gears;
  double? fuelEfficiency;
  int? topSpeed;
  String? originCountry;
  String? assemblyCountry;
  double? acceleration;
  int? length;
  int? width;
  int? height;
  int? groundClearance;
  int? wheelbase;
  int? trunkSize;
  int? seats;
  String? drivetrain;
  int? horsePower;
  int? engineCapacity;

  Specifications({
    this.city,
    this.fuel,
    this.transmission,
    this.color,
    this.year,
    this.description,
    this.mileage,
    this.gears,
    this.fuelEfficiency,
    this.topSpeed,
    this.originCountry,
    this.assemblyCountry,
    this.acceleration,
    this.length,
    this.width,
    this.height,
    this.groundClearance,
    this.wheelbase,
    this.trunkSize,
    this.seats,
    this.drivetrain,
    this.horsePower,
    this.engineCapacity,
  });

  factory Specifications.fromJson(Map<String, dynamic> json) =>
      _$SpecificationsFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificationsToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
