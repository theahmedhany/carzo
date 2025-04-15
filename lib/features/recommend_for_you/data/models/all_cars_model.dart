import 'package:json_annotation/json_annotation.dart';

part 'all_cars_model.g.dart';

@JsonSerializable()
class AllCarsModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  AllCarsModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory AllCarsModel.fromJson(Map<String, dynamic> json) =>
      _$AllCarsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllCarsModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
