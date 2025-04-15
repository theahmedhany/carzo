// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_personal_car_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellPersonalCarResponse _$SellPersonalCarResponseFromJson(
  Map<String, dynamic> json,
) => SellPersonalCarResponse(
  message: json['message'] as String?,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  statusCode: (json['statusCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$SellPersonalCarResponseToJson(
  SellPersonalCarResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
};
