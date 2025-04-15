import 'package:json_annotation/json_annotation.dart';

part 'favorite_car_model.g.dart';

@JsonSerializable()
class FavoriteCarModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  FavoriteCarModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory FavoriteCarModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteCarModelFromJson(json);

  get brand => null;

  Map<String, dynamic> toJson() => _$FavoriteCarModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
