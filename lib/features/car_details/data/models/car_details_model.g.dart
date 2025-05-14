// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDetailsModel _$CarDetailsModelFromJson(Map<String, dynamic> json) =>
    CarDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      carName: json['carName'] as String?,
      status: json['status'] as String?,
      price: (json['price'] as num?)?.toInt(),
      condition: json['condition'] as String?,
      dealershipName: json['dealershipName'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      specifications:
          json['specifications'] == null
              ? null
              : Specifications.fromJson(
                json['specifications'] as Map<String, dynamic>,
              ),
      url:
          (json['url'] as List<dynamic>?)
              ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
              .toList(),
      phone: json['phone'] as String?,
      location: json['location'] as String?,
    )..dealershipImg = json['dealershipImg'] as String?;

Map<String, dynamic> _$CarDetailsModelToJson(CarDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carName': instance.carName,
      'status': instance.status,
      'price': instance.price,
      'condition': instance.condition,
      'dealershipName': instance.dealershipName,
      'brand': instance.brand,
      'model': instance.model,
      'specifications': instance.specifications,
      'url': instance.url,
      'phone': instance.phone,
      'location': instance.location,
      'dealershipImg': instance.dealershipImg,
    };

Specifications _$SpecificationsFromJson(Map<String, dynamic> json) =>
    Specifications(
      city: json['city'] as String?,
      fuel: json['fuel'] as String?,
      transmission: json['transmission'] as String?,
      color: json['color'] as String?,
      year: (json['year'] as num?)?.toInt(),
      description: json['description'] as String?,
      mileage: (json['mileage'] as num?)?.toInt(),
      gears: (json['gears'] as num?)?.toInt(),
      fuelEfficiency: (json['fuelEfficiency'] as num?)?.toDouble(),
      topSpeed: (json['topSpeed'] as num?)?.toInt(),
      originCountry: json['originCountry'] as String?,
      assemblyCountry: json['assemblyCountry'] as String?,
      acceleration: (json['acceleration'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      groundClearance: (json['groundClearance'] as num?)?.toInt(),
      wheelbase: (json['wheelbase'] as num?)?.toInt(),
      trunkSize: (json['trunkSize'] as num?)?.toInt(),
      seats: (json['seats'] as num?)?.toInt(),
      drivetrain: json['drivetrain'] as String?,
      horsePower: (json['horsePower'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpecificationsToJson(Specifications instance) =>
    <String, dynamic>{
      'city': instance.city,
      'fuel': instance.fuel,
      'transmission': instance.transmission,
      'color': instance.color,
      'year': instance.year,
      'description': instance.description,
      'mileage': instance.mileage,
      'gears': instance.gears,
      'fuelEfficiency': instance.fuelEfficiency,
      'topSpeed': instance.topSpeed,
      'originCountry': instance.originCountry,
      'assemblyCountry': instance.assemblyCountry,
      'acceleration': instance.acceleration,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'groundClearance': instance.groundClearance,
      'wheelbase': instance.wheelbase,
      'trunkSize': instance.trunkSize,
      'seats': instance.seats,
      'drivetrain': instance.drivetrain,
      'horsePower': instance.horsePower,
    };

Url _$UrlFromJson(Map<String, dynamic> json) =>
    Url(url: json['url'] as String?);

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
  'url': instance.url,
};
