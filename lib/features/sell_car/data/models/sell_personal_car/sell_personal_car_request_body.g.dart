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
  YearOfManufacture: json['YearOfManufacture'] as String,
  Kilometers: json['Kilometers'] as String,
  Address: json['Address'] as String,
  SellerEmail: json['SellerEmail'] as String,
  ContactInfo: json['ContactInfo'] as String,
  TypeOfPlan: json['TypeOfPlan'] as String,
  PriceOfPlan: json['PriceOfPlan'] as String,
  AppUserId: json['AppUserId'] as String,
);

Map<String, dynamic> _$SellPersonalCarRequestBodyToJson(
  SellPersonalCarRequestBody instance,
) => <String, dynamic>{
  'Images': instance.Images,
  'brand': instance.brand,
  'Model': instance.Model,
  'YearOfManufacture': instance.YearOfManufacture,
  'Kilometers': instance.Kilometers,
  'Transmission': instance.Transmission,
  'FuelType': instance.FuelType,
  'Color': instance.Color,
  'Description': instance.Description,
  'Price': instance.Price,
  'Address': instance.Address,
  'Location': instance.Location,
  'SellerEmail': instance.SellerEmail,
  'ContactInfo': instance.ContactInfo,
  'TypeOfPlan': instance.TypeOfPlan,
  'PriceOfPlan': instance.PriceOfPlan,
  'AppUserId': instance.AppUserId,
};
