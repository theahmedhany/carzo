import 'package:json_annotation/json_annotation.dart';

part 'insurance_companies_model.g.dart';

@JsonSerializable()
class InsuranceCompaniesModel {
  int? id;
  String? pictureUrl;
  String? name;
  String? description;
  String? phone;
  String? location;
  String? whatsApp;

  InsuranceCompaniesModel({
    this.id,
    this.pictureUrl,
    this.name,
    this.description,
    this.phone,
    this.location,
    this.whatsApp,
  });

  factory InsuranceCompaniesModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceCompaniesModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceCompaniesModelToJson(this);
}
