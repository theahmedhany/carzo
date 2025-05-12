// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_advertisements_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAdvertisementsModel _$UserAdvertisementsModelFromJson(
  Map<String, dynamic> json,
) => UserAdvertisementsModel(
  id: (json['id'] as num?)?.toInt(),
  carId: (json['carId'] as num?)?.toInt(),
  image:
      json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  price: (json['price'] as num?)?.toInt(),
  contactInfo: json['contactInfo'] as String?,
);

Map<String, dynamic> _$UserAdvertisementsModelToJson(
  UserAdvertisementsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'carId': instance.carId,
  'image': instance.image,
  'brand': instance.brand,
  'model': instance.model,
  'price': instance.price,
  'contactInfo': instance.contactInfo,
};

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) =>
    ImageModel(url: json['url'] as String?);

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{'url': instance.url};
