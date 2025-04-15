import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../data/models/sell_personal_car/sell_personal_car_request_body.dart';
import '../../data/repos/sell_personal_car_repo.dart';
import 'sell_personal_car_state.dart';

class SellPersonalCarCubit extends Cubit<SellPersonalCarState> {
  SellPersonalCarCubit(this.sellPersonalCarRepo)
    : super(const SellPersonalCarState.idle());

  final SellPersonalCarRepo sellPersonalCarRepo;
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearOfManufactureController =
      TextEditingController();
  final TextEditingController kilometersController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController contactInfoController = TextEditingController();

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
            emit(SellPersonalCarState.imagesUpdated(updatedImages.length));
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
      emit(SellPersonalCarState.imagesUpdated(_selectedImages.length));
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

    emit(const SellPersonalCarState.loading());

    try {
      final imagePaths = getImagePaths();

      final appUserId = await SharedPrefHelper.getString(
        SharedPrefKeys.appUserId,
      );

      final userEmail = await SharedPrefHelper.getString(
        SharedPrefKeys.userEmail,
      );

      final requestBody = SellPersonalCarRequestBody(
        Images: imagePaths,
        brand: brandController.text.trim(),
        Price: priceController.text.trim(),
        Model: modelController.text.trim(),
        Location: locationController.text.trim(),
        FuelType: fuelController.text.trim(),
        Transmission: transmissionController.text.trim(),
        Color: colorController.text.trim(),
        Description: descriptionController.text.trim(),
        YearOfManufacture: yearOfManufactureController.text.trim(),
        Kilometers: kilometersController.text.trim(),

        ContactInfo: contactInfoController.text.trim(),

        Address: 'Unknown', // addressController.text.trim()
        TypeOfPlan: 'Monthly', // typeOfPlanController.text.trim()
        PriceOfPlan: '123456', // priceOfPlanController.text.trim()

        SellerEmail: userEmail,
        AppUserId: appUserId,
      );

      final response = await sellPersonalCarRepo.sellPersonalCar(
        requestBody,
        imagePaths,
      );

      response.when(
        success: (response) {
          _selectedImages.clear();
          brandController.clear();
          modelController.clear();
          yearOfManufactureController.clear();
          kilometersController.clear();
          transmissionController.clear();
          fuelController.clear();
          colorController.clear();
          descriptionController.clear();
          priceController.clear();
          locationController.clear();
          contactInfoController.clear();

          emit(SellPersonalCarState.success(response));
        },
        failure: (error) {
          String errorMessage;
          if (error.errors != null && error.errors!.isNotEmpty) {
            errorMessage = error.errors!.map((e) => "• $e").join('\n');
          } else {
            errorMessage =
                "• ${error.message ?? "An unexpected error occurred."}";
          }
          emit(SellPersonalCarState.error(error: errorMessage));
        },
      );
    } catch (e) {
      emit(SellPersonalCarState.error(error: "An unexpected error occurred."));
    }
  }

  void dispose() {
    brandController.dispose();
    modelController.dispose();
    yearOfManufactureController.dispose();
    kilometersController.dispose();
    transmissionController.dispose();
    fuelController.dispose();
    colorController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    locationController.dispose();
    contactInfoController.dispose();

    super.close();
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
