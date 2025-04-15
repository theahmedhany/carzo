import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/widgets/custom_alert_dialog.dart';
import 'package:carzo/features/sell_car/data/models/sell_new_car/sell_new_car_request_body.dart';
import 'package:carzo/features/sell_car/data/repos/sell_new_car_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'sell_new_car_state.dart';

class SellNewCarCubit extends Cubit<SellNewCarState> {
  SellNewCarCubit(this.sellNewCarRepo) : super(const SellNewCarState.idle());

  final SellNewCarRepo sellNewCarRepo;
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = [];

  final TextEditingController brandController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController dealershipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController gearsController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController fuelEfficiencyController =
      TextEditingController();
  final TextEditingController topSpeedController = TextEditingController();
  final TextEditingController originCountryController = TextEditingController();
  final TextEditingController assemblyCountryController =
      TextEditingController();
  final TextEditingController accelerationController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController groundClearanceController =
      TextEditingController();
  final TextEditingController wheelbaseController = TextEditingController();
  final TextEditingController trunkSizeController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController drivetrainController = TextEditingController();
  final TextEditingController fuelController = TextEditingController();
  final TextEditingController horsePowerController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController colorController = TextEditingController();

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
            emit(SellNewCarState.imagesUpdated(updatedImages.length));
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
      emit(SellNewCarState.imagesUpdated(_selectedImages.length));
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
      showErrorDialog(context, "Maximum 6 images allowed");
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

    emit(const SellNewCarState.loading());

    try {
      final imagePaths = getImagePaths();

      final requestBody = SellNewCarRequestBody(
        Images: imagePaths,
        brand: brandController.text.trim(),
        Price: priceController.text.trim(),
        Model: modelController.text.trim(),
        Condition: 'Available', // conditionController.text.trim(),
        dealership: dealershipController.text.trim(),
        Phone: phoneController.text.trim(),
        Location: locationController.text.trim(),
        Gears: gearsController.text.trim(),
        Year: yearController.text.trim(),
        FuelEfficiency: fuelEfficiencyController.text.trim(),
        TopSpeed: topSpeedController.text.trim(),
        OriginCountry: originCountryController.text.trim(),
        AssemblyCountry: assemblyCountryController.text.trim(),
        Acceleration: accelerationController.text.trim(),
        Length: lengthController.text.trim(),
        Width: widthController.text.trim(),
        Height: heightController.text.trim(),
        GroundClearance: groundClearanceController.text.trim(),
        Wheelbase: wheelbaseController.text.trim(),
        TrunkSize: trunkSizeController.text.trim(),
        Seats: seatsController.text.trim(),
        Drivetrain: drivetrainController.text.trim(),
        Fuel: fuelController.text.trim(),
        HorsePower: horsePowerController.text.trim(),
        Transmission: transmissionController.text.trim(),
        Color: colorController.text.trim(),
      );

      final response = await sellNewCarRepo.sellNewCar(requestBody, imagePaths);

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
          gearsController.clear();
          yearController.clear();
          fuelEfficiencyController.clear();
          topSpeedController.clear();
          originCountryController.clear();
          assemblyCountryController.clear();
          accelerationController.clear();
          lengthController.clear();
          widthController.clear();
          heightController.clear();
          groundClearanceController.clear();
          wheelbaseController.clear();
          trunkSizeController.clear();
          seatsController.clear();
          drivetrainController.clear();
          fuelController.clear();
          horsePowerController.clear();
          transmissionController.clear();
          colorController.clear();

          emit(SellNewCarState.success(response));
        },
        failure: (error) {
          String errorMessage;
          if (error.errors != null && error.errors!.isNotEmpty) {
            errorMessage = error.errors!.map((e) => "• $e").join('\n');
          } else {
            errorMessage =
                "• ${error.message ?? "An unexpected error occurred."}";
          }
          emit(SellNewCarState.error(error: errorMessage));
        },
      );
    } catch (e) {
      emit(SellNewCarState.error(error: "An unexpected error occurred."));
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
    gearsController.dispose();
    yearController.dispose();
    fuelEfficiencyController.dispose();
    topSpeedController.dispose();
    originCountryController.dispose();
    assemblyCountryController.dispose();
    accelerationController.dispose();
    lengthController.dispose();
    widthController.dispose();
    heightController.dispose();
    groundClearanceController.dispose();
    wheelbaseController.dispose();
    trunkSizeController.dispose();
    seatsController.dispose();
    drivetrainController.dispose();
    fuelController.dispose();
    horsePowerController.dispose();
    transmissionController.dispose();
    colorController.dispose();
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
