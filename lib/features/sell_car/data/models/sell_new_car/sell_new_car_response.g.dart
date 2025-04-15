// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_new_car_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellNewCarResponse _$SellNewCarResponseFromJson(Map<String, dynamic> json) =>
    SellNewCarResponse(
      message: json['message'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SellNewCarResponseToJson(SellNewCarResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };
