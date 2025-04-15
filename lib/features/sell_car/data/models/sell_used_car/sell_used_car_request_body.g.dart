// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_used_car_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellUsedCarRequestBody _$SellUsedCarRequestBodyFromJson(
  Map<String, dynamic> json,
) => SellUsedCarRequestBody(
  Images: (json['Images'] as List<dynamic>).map((e) => e as String).toList(),
  Fuel: json['Fuel'] as String,
  Mileage: json['Mileage'] as String,
  Description: json['Description'] as String,
  City: json['City'] as String,
  brand: json['brand'] as String,
  Price: json['Price'] as String,
  Model: json['Model'] as String,
  Condition: json['Condition'] as String,
  dealership: json['dealership'] as String,
  Phone: json['Phone'] as String,
  Location: json['Location'] as String,
  Year: json['Year'] as String,
  Transmission: json['Transmission'] as String,
  Color: json['Color'] as String,
);

Map<String, dynamic> _$SellUsedCarRequestBodyToJson(
  SellUsedCarRequestBody instance,
) => <String, dynamic>{
  'Images': instance.Images,
  'brand': instance.brand,
  'Price': instance.Price,
  'Model': instance.Model,
  'Condition': instance.Condition,
  'Fuel': instance.Fuel,
  'Transmission': instance.Transmission,
  'Color': instance.Color,
  'Year': instance.Year,
  'Mileage': instance.Mileage,
  'Description': instance.Description,
  'dealership': instance.dealership,
  'Phone': instance.Phone,
  'Location': instance.Location,
  'City': instance.City,
};
