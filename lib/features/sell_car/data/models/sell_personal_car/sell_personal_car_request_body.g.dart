// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_personal_car_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellPersonalCarRequestBody _$SellPersonalCarRequestBodyFromJson(
  Map<String, dynamic> json,
) => SellPersonalCarRequestBody(
  Images: (json['Images'] as List<dynamic>).map((e) => e as String).toList(),
  FuelType: json['FuelType'] as String,
  Description: json['Description'] as String,
  brand: json['brand'] as String,
  Price: json['Price'] as String,
  Model: json['Model'] as String,
  Location: json['Location'] as String,
  Transmission: json['Transmission'] as String,
  Color: json['Color'] as String,
  ManufacturingYear: json['ManufacturingYear'] as String,
  Kilometers: json['Kilometers'] as String,
  City: json['City'] as String,
  SellerEmail: json['SellerEmail'] as String,
  ContactInfo: json['ContactInfo'] as String,
  TypeOfPlan: json['TypeOfPlan'] as String,
  AppUserId: json['AppUserId'] as String,
);

Map<String, dynamic> _$SellPersonalCarRequestBodyToJson(
  SellPersonalCarRequestBody instance,
) => <String, dynamic>{
  'Images': instance.Images,
  'brand': instance.brand,
  'Model': instance.Model,
  'ManufacturingYear': instance.ManufacturingYear,
  'Kilometers': instance.Kilometers,
  'Transmission': instance.Transmission,
  'FuelType': instance.FuelType,
  'Color': instance.Color,
  'Description': instance.Description,
  'Price': instance.Price,
  'City': instance.City,
  'Location': instance.Location,
  'SellerEmail': instance.SellerEmail,
  'ContactInfo': instance.ContactInfo,
  'TypeOfPlan': instance.TypeOfPlan,
  'AppUserId': instance.AppUserId,
};
