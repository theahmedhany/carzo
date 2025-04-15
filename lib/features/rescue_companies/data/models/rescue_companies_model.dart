import 'package:json_annotation/json_annotation.dart';

part 'rescue_companies_model.g.dart';

@JsonSerializable()
class RescueCompaniesModel {
  int? id;
  String? pictureUrl;
  String? name;
  String? city;
  String? description;
  String? phone1;
  String? phone2;
  String? phone3;
  String? whatsApp;
  String? location;
  String? service1;
  String? service2;
  String? service3;
  String? service4;

  RescueCompaniesModel({
    this.id,
    this.pictureUrl,
    this.name,
    this.city,
    this.description,
    this.phone1,
    this.phone2,
    this.phone3,
    this.whatsApp,
    this.location,
    this.service1,
    this.service2,
    this.service3,
    this.service4,
  });

  factory RescueCompaniesModel.fromJson(Map<String, dynamic> json) =>
      _$RescueCompaniesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RescueCompaniesModelToJson(this);
}
