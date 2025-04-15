import 'package:json_annotation/json_annotation.dart';

part 'maintenance_companies_model.g.dart';

@JsonSerializable()
class MaintenanceCompaniesModel {
  int? id;
  String? pictureUrl;
  String? name;
  String? availableServices;
  String? description;
  String? phone;
  String? whatsApp;
  String? location;

  MaintenanceCompaniesModel({
    this.id,
    this.pictureUrl,
    this.name,
    this.availableServices,
    this.description,
    this.phone,
    this.whatsApp,
    this.location,
  });

  factory MaintenanceCompaniesModel.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceCompaniesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceCompaniesModelToJson(this);
}
