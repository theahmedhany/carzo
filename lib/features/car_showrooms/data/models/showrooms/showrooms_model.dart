import 'package:json_annotation/json_annotation.dart';

part 'showrooms_model.g.dart';

@JsonSerializable()
class ShowroomsModel {
  final int? id;
  final String? name;
  final String? pictureUrl;
  final String? phone1;
  final int? phone2;
  final int? phone3;
  final int? whatsApp1;
  final String? facebook;
  final String? instagram;
  final String? branch1;
  final String? branch2;
  final String? branch3;

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
