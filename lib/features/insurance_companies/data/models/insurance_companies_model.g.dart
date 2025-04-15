// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceCompaniesModel _$InsuranceCompaniesModelFromJson(
  Map<String, dynamic> json,
) => InsuranceCompaniesModel(
  id: (json['id'] as num?)?.toInt(),
  pictureUrl: json['pictureUrl'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  phone: json['phone'] as String?,
  location: json['location'] as String?,
  whatsApp: json['whatsApp'] as String?,
);

Map<String, dynamic> _$InsuranceCompaniesModelToJson(
  InsuranceCompaniesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'pictureUrl': instance.pictureUrl,
  'name': instance.name,
  'description': instance.description,
  'phone': instance.phone,
  'location': instance.location,
  'whatsApp': instance.whatsApp,
};
