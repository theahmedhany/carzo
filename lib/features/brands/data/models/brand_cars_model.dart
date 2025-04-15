import 'package:json_annotation/json_annotation.dart';

part 'brand_cars_model.g.dart';

@JsonSerializable()
class BrandCarsModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  BrandCarsModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory BrandCarsModel.fromJson(Map<String, dynamic> json) =>
      _$BrandCarsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandCarsModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
