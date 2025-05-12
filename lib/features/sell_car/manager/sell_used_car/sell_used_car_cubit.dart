import 'dart:io';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../data/models/sell_used_car/sell_used_car_request_body.dart';
import '../../data/repos/sell_used_car_repo.dart';
import 'sell_used_car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SellUsedCarCubit extends Cubit<SellUsedCarState> {
  SellUsedCarCubit(this.sellUsedCarRepo) : super(const SellUsedCarState.idle());

  final SellUsedCarRepo sellUsedCarRepo;
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dealershipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<String> getImagePaths() {
    return _selectedImages.map((file) => file.absolute.path).toList();
  }

  List<File> get selectedImages => List.unmodifiable(_selectedImages);

  Future<void> pickImage(ImageSource source, BuildContext context) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 70,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);

        try {
          final fileSize = await file.length();
          if (fileSize > 5 * 1024 * 1024) {
            showErrorDialog(context, "Image size should not exceed 5MB");
            return;
          }

          final extension = pickedFile.path.split('.').last.toLowerCase();
          if (!['jpg', 'jpeg', 'png'].contains(extension)) {
            showErrorDialog(
              context,
              "Only JPG, JPEG and PNG images are allowed",
            );
            return;
          }

          await file.readAsBytes();

          final updatedImages = [..._selectedImages, file];

          if (updatedImages.length <= 6) {
            _selectedImages = updatedImages;
            emit(SellUsedCarState.imagesUpdated(updatedImages.length));
          } else {
            showErrorDialog(context, "You can upload a maximum of 6 images");
          }
        } catch (e) {
          showErrorDialog(context, "Failed to process image: ${e.toString()}");
        }
      }
    } catch (e) {
      showErrorDialog(context, "Failed to pick image: ${e.toString()}");
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < _selectedImages.length) {
      _selectedImages.removeAt(index);
      emit(SellUsedCarState.imagesUpdated(_selectedImages.length));
    }
  }

  Future<void> submitCarListing(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (_selectedImages.isEmpty) {
      showErrorDialog(context, "Please add at least one image");
      return;
    }

    if (_selectedImages.length > 6) {
      showErrorDialog(context, "You can upload a maximum of 6 images");
      return;
    }

    for (final image in _selectedImages) {
      try {
        if (!await image.exists()) {
          showErrorDialog(context, "One or more images are missing");
          return;
        }

        final fileSize = await image.length();
        if (fileSize > 5 * 1024 * 1024) {
          showErrorDialog(context, "All images must be under 5MB");
          return;
        }

        final extension = image.path.split('.').last.toLowerCase();
        if (!['jpg', 'jpeg', 'png'].contains(extension)) {
          showErrorDialog(context, "Only JPG, JPEG and PNG images are allowed");
          return;
        }

        try {
          await image.readAsBytes();
        } catch (e) {
          showErrorDialog(
            context,
            "One or more images are corrupted or unreadable",
          );
          return;
        }
      } catch (e) {
        showErrorDialog(context, "Error validating images: ${e.toString()}");
        return;
      }
    }

    emit(const SellUsedCarState.loading());

    try {
      final imagePaths = getImagePaths();

      final requestBody = SellUsedCarRequestBody(
        Images: imagePaths,
        brand: brandController.text.trim(),
        Price: priceController.text.trim(),
        Model: modelController.text.trim(),
        Condition: 'Available', // conditionController.text.trim(),
        dealership: dealershipController.text.trim(),
        Phone: phoneController.text.trim(),
        Location: locationController.text.trim(),
        ManufacturingYear: yearController.text.trim(),
        FuelType: fuelController.text.trim(),
        Transmission: transmissionController.text.trim(),
        Color: colorController.text.trim(),
        Mileage: mileageController.text.trim(),
        Description: descriptionController.text.trim(),
        City: 'Unknown', // cityController.text.trim()
      );

      final response = await sellUsedCarRepo.sellUsedCar(
        requestBody,
        imagePaths,
      );

      response.when(
        success: (response) {
          _selectedImages.clear();
          brandController.clear();
          priceController.clear();
          modelController.clear();
          conditionController.clear();
          dealershipController.clear();
          phoneController.clear();
          locationController.clear();
          yearController.clear();
          fuelController.clear();
          transmissionController.clear();
          colorController.clear();
          mileageController.clear();
          descriptionController.clear();

          emit(SellUsedCarState.success(response));
        },
        failure: (error) {
          String errorMessage;
          if (error.errors != null && error.errors!.isNotEmpty) {
            errorMessage = error.errors!.map((e) => "• $e").join('\n');
          } else {
            errorMessage =
                "• ${error.message ?? "An unexpected error occurred."}";
          }
          emit(SellUsedCarState.error(error: errorMessage));
        },
      );
    } catch (e) {
      emit(SellUsedCarState.error(error: "An unexpected error occurred."));
    }
  }

  void dispose() {
    brandController.dispose();
    priceController.dispose();
    modelController.dispose();
    conditionController.dispose();
    dealershipController.dispose();
    phoneController.dispose();
    locationController.dispose();
    yearController.dispose();
    fuelController.dispose();
    transmissionController.dispose();
    colorController.dispose();
    mileageController.dispose();
    descriptionController.dispose();
  }

  void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder:
          (context) => CustomAlertDialog(
            dialogColor: Colors.redAccent,
            dialogHeader: 'Sell Car Failed',
            dialogBody: error,
            dialogIcon: Icons.error,
            press: () => context.pop(),
          ),
    );
  }
}
