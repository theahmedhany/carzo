import 'package:json_annotation/json_annotation.dart';

part 'new_car_model.g.dart';

@JsonSerializable()
class NewCarModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  NewCarModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory NewCarModel.fromJson(Map<String, dynamic> json) =>
      _$NewCarModelFromJson(json);

  get brand => null;

  Map<String, dynamic> toJson() => _$NewCarModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
