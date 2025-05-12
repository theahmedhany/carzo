import 'package:json_annotation/json_annotation.dart';

part 'user_advertisements_model.g.dart';

@JsonSerializable()
class UserAdvertisementsModel {
  final int? id;
  int? carId;
  final ImageModel? image;
  final String? brand;
  final String? model;
  final int? price;
  final String? contactInfo;

  UserAdvertisementsModel({
    this.id,
    this.carId,
    this.image,
    this.brand,
    this.model,
    this.price,
    this.contactInfo,
  });

  factory UserAdvertisementsModel.fromJson(Map<String, dynamic> json) =>
      _$UserAdvertisementsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserAdvertisementsModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  final String? url;

  ImageModel({this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
