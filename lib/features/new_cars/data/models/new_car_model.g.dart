// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCarModel _$NewCarModelFromJson(Map<String, dynamic> json) => NewCarModel(
  carId: (json['carId'] as num?)?.toInt(),
  status: json['status'] as String?,
  carName: json['carName'] as String?,
  price: (json['price'] as num?)?.toInt(),
  condition: json['condition'] as String?,
  dealershipName: json['dealershipName'] as String?,
  url:
      (json['url'] as List<dynamic>?)
          ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$NewCarModelToJson(NewCarModel instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'status': instance.status,
      'carName': instance.carName,
      'price': instance.price,
      'condition': instance.condition,
      'dealershipName': instance.dealershipName,
      'url': instance.url,
    };

Url _$UrlFromJson(Map<String, dynamic> json) =>
    Url(url: json['url'] as String?);

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
  'url': instance.url,
};
