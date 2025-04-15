// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_new_car_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellNewCarRequestBody _$SellNewCarRequestBodyFromJson(
  Map<String, dynamic> json,
) => SellNewCarRequestBody(
  Images: (json['Images'] as List<dynamic>).map((e) => e as String).toList(),
  brand: json['brand'] as String,
  Price: json['Price'] as String,
  Model: json['Model'] as String,
  Condition: json['Condition'] as String,
  dealership: json['dealership'] as String,
  Phone: json['Phone'] as String,
  Location: json['Location'] as String,
  Gears: json['Gears'] as String,
  Year: json['Year'] as String,
  FuelEfficiency: json['FuelEfficiency'] as String,
  TopSpeed: json['TopSpeed'] as String,
  OriginCountry: json['OriginCountry'] as String,
  AssemblyCountry: json['AssemblyCountry'] as String,
  Acceleration: json['Acceleration'] as String,
  Length: json['Length'] as String,
  Width: json['Width'] as String,
  Height: json['Height'] as String,
  GroundClearance: json['GroundClearance'] as String,
  Wheelbase: json['Wheelbase'] as String,
  TrunkSize: json['TrunkSize'] as String,
  Seats: json['Seats'] as String,
  Drivetrain: json['Drivetrain'] as String,
  Fuel: json['Fuel'] as String,
  HorsePower: json['HorsePower'] as String,
  Transmission: json['Transmission'] as String,
  Color: json['Color'] as String,
);

Map<String, dynamic> _$SellNewCarRequestBodyToJson(
  SellNewCarRequestBody instance,
) => <String, dynamic>{
  'Images': instance.Images,
  'brand': instance.brand,
  'Price': instance.Price,
  'Model': instance.Model,
  'Condition': instance.Condition,
  'dealership': instance.dealership,
  'Phone': instance.Phone,
  'Location': instance.Location,
  'Gears': instance.Gears,
  'Year': instance.Year,
  'FuelEfficiency': instance.FuelEfficiency,
  'TopSpeed': instance.TopSpeed,
  'OriginCountry': instance.OriginCountry,
  'AssemblyCountry': instance.AssemblyCountry,
  'Acceleration': instance.Acceleration,
  'Length': instance.Length,
  'Width': instance.Width,
  'Height': instance.Height,
  'GroundClearance': instance.GroundClearance,
  'Wheelbase': instance.Wheelbase,
  'TrunkSize': instance.TrunkSize,
  'Seats': instance.Seats,
  'Drivetrain': instance.Drivetrain,
  'Fuel': instance.Fuel,
  'HorsePower': instance.HorsePower,
  'Transmission': instance.Transmission,
  'Color': instance.Color,
};
