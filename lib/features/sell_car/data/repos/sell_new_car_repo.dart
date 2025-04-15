import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/features/sell_car/data/models/sell_new_car/sell_new_car_request_body.dart';
import 'package:carzo/features/sell_car/data/models/sell_new_car/sell_new_car_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
import 'dart:io';

class SellNewCarRepo {
  final ApiServices _apiServices;

  SellNewCarRepo(this._apiServices);

  Future<ApiResult<SellNewCarResponse>> sellNewCar(
    SellNewCarRequestBody sellNewCarRequestBody,
    List<String> imagePaths,
  ) async {
    try {
      final formData = FormData();

      final Map<String, dynamic> json = sellNewCarRequestBody.toJson();
      json.forEach((key, value) {
        if (key != 'Images') {
          formData.fields.add(MapEntry(key, value.toString()));
        }
      });

      for (int i = 0; i < imagePaths.length; i++) {
        final imagePath = imagePaths[i];

        final file = File(imagePath);
        if (!await file.exists()) {
          return ApiResult.failure(
            ApiNetworkExceptions.getDioException(
              "One or more image files are missing",
            ),
          );
        }

        try {
          await file.readAsBytes();
        } catch (e) {
          return ApiResult.failure(
            ApiNetworkExceptions.getDioException(
              "Failed to read image file: $e",
            ),
          );
        }

        final mimeType = mime(imagePath) ?? 'image/jpeg';
        if (!mimeType.startsWith('image/')) {
          return ApiResult.failure(
            ApiNetworkExceptions.getDioException(
              "Invalid image format detected",
            ),
          );
        }

        try {
          final mimeData = mimeType.split('/');
          final fileName = 'image_$i.${mimeData[1]}';
          final multipartFile = await MultipartFile.fromFile(
            imagePath,
            filename: fileName,
            contentType: MediaType(mimeData[0], mimeData[1]),
          );

          formData.files.add(MapEntry('Image', multipartFile));
        } catch (e) {
          return ApiResult.failure(
            ApiNetworkExceptions.getDioException("Failed to process image: $e"),
          );
        }
      }

      final response = await _apiServices.sellNewCar(formData);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(e));
    }
  }
}
