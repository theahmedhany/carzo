import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/sell_used_car/sell_used_car_request_body.dart';
import '../models/sell_used_car/sell_used_car_response.dart';

class SellUsedCarRepo {
  final ApiServices _apiServices;

  SellUsedCarRepo(this._apiServices);

  Future<ApiResult<SellUsedCarResponse>> sellUsedCar(
    SellUsedCarRequestBody sellUsedCarRequestBody,
    List<String> imagePaths,
  ) async {
    try {
      final formData = FormData();

      final Map<String, dynamic> json = sellUsedCarRequestBody.toJson();
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

      final response = await _apiServices.sellUsedCar(formData);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(e));
    }
  }
}
