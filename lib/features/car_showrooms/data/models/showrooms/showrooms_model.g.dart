// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showrooms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowroomsModel _$ShowroomsModelFromJson(Map<String, dynamic> json) =>
    ShowroomsModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      pictureUrl: json['pictureUrl'] as String?,
      phone1: (json['phone1'] as num?)?.toInt(),
      phone2: (json['phone2'] as num?)?.toInt(),
      phone3: (json['phone3'] as num?)?.toInt(),
      whatsApp1: (json['whatsApp1'] as num?)?.toInt(),
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
      branch1: json['branch1'] as String?,
      branch2: json['branch2'] as String?,
      branch3: json['branch3'] as String?,
    );

Map<String, dynamic> _$ShowroomsModelToJson(ShowroomsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'phone1': instance.phone1,
      'phone2': instance.phone2,
      'phone3': instance.phone3,
      'whatsApp1': instance.whatsApp1,
      'facebook': instance.facebook,
      'instagram': instance.instagram,
      'branch1': instance.branch1,
      'branch2': instance.branch2,
      'branch3': instance.branch3,
    };
