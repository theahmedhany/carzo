import 'package:json_annotation/json_annotation.dart';

part 'used_car_model.g.dart';

@JsonSerializable()
class UsedCarModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  UsedCarModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory UsedCarModel.fromJson(Map<String, dynamic> json) =>
      _$UsedCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsedCarModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
