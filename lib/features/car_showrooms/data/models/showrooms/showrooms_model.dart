import 'package:json_annotation/json_annotation.dart';

part 'showrooms_model.g.dart';

@JsonSerializable()
class ShowroomsModel {
  int? id;
  String? name;
  String? pictureUrl;
  int? phone1;
  int? phone2;
  int? phone3;
  int? whatsApp1;
  String? facebook;
  String? instagram;
  String? branch1;
  String? branch2;
  String? branch3;

  ShowroomsModel({
    this.id,
    this.name,
    this.pictureUrl,
    this.phone1,
    this.phone2,
    this.phone3,
    this.whatsApp1,
    this.facebook,
    this.instagram,
    this.branch1,
    this.branch2,
    this.branch3,
  });

  factory ShowroomsModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomsModelToJson(this);
}
