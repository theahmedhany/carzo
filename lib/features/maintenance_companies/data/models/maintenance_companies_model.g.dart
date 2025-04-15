// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_companies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceCompaniesModel _$MaintenanceCompaniesModelFromJson(
  Map<String, dynamic> json,
) => MaintenanceCompaniesModel(
  id: (json['id'] as num?)?.toInt(),
  pictureUrl: json['pictureUrl'] as String?,
  name: json['name'] as String?,
  availableServices: json['availableServices'] as String?,
  description: json['description'] as String?,
  phone: json['phone'] as String?,
  whatsApp: json['whatsApp'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$MaintenanceCompaniesModelToJson(
  MaintenanceCompaniesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'pictureUrl': instance.pictureUrl,
  'name': instance.name,
  'availableServices': instance.availableServices,
  'description': instance.description,
  'phone': instance.phone,
  'whatsApp': instance.whatsApp,
  'location': instance.location,
};
