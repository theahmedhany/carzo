// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rescue_companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RescueCompaniesModel _$RescueCompaniesModelFromJson(
  Map<String, dynamic> json,
) => RescueCompaniesModel(
  id: (json['id'] as num?)?.toInt(),
  pictureUrl: json['pictureUrl'] as String?,
  name: json['name'] as String?,
  city: json['city'] as String?,
  description: json['description'] as String?,
  phone1: json['phone1'] as String?,
  phone2: json['phone2'] as String?,
  phone3: json['phone3'] as String?,
  whatsApp: json['whatsApp'] as String?,
  location: json['location'] as String?,
  service1: json['service1'] as String?,
  service2: json['service2'] as String?,
  service3: json['service3'] as String?,
  service4: json['service4'] as String?,
);

Map<String, dynamic> _$RescueCompaniesModelToJson(
  RescueCompaniesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'pictureUrl': instance.pictureUrl,
  'name': instance.name,
  'city': instance.city,
  'description': instance.description,
  'phone1': instance.phone1,
  'phone2': instance.phone2,
  'phone3': instance.phone3,
  'whatsApp': instance.whatsApp,
  'location': instance.location,
  'service1': instance.service1,
  'service2': instance.service2,
  'service3': instance.service3,
  'service4': instance.service4,
};
