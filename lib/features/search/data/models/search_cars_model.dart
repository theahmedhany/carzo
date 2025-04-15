import 'package:json_annotation/json_annotation.dart';

part 'search_cars_model.g.dart';

@JsonSerializable()
class SearchCarsModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  SearchCarsModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory SearchCarsModel.fromJson(Map<String, dynamic> json) =>
      _$SearchCarsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCarsModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
