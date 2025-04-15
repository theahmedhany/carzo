// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_used_car_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellUsedCarResponse _$SellUsedCarResponseFromJson(Map<String, dynamic> json) =>
    SellUsedCarResponse(
      message: json['message'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SellUsedCarResponseToJson(
  SellUsedCarResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
};
