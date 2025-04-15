import 'package:json_annotation/json_annotation.dart';

part 'showroom_cars_model.g.dart';

@JsonSerializable()
class ShowroomCarsModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;

  ShowroomCarsModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
  });

  factory ShowroomCarsModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomCarsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomCarsModelToJson(this);
}

@JsonSerializable()
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
