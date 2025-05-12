// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_brands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllBrandsModel _$AllBrandsModelFromJson(Map<String, dynamic> json) =>
    AllBrandsModel(
      name: json['name'] as String,
      pictureUrl: json['pictureUrl'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$AllBrandsModelToJson(AllBrandsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pictureUrl': instance.pictureUrl,
      'id': instance.id,
    };
