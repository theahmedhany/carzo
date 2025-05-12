class ApiConstants {
  static const String apiBaseUrl = "http://arabytak.runasp.net/api/";

  static const String apiNewCars = "Car/AllCars/New/";
  static const String apiUsedCars = "Car/AllCars/Used";
  static const String apiAllCars = "Car/GetAllCars";
  static const String apiBrandCars = "Car/GetAllCars";
  static const String apiAllBrand = "Brand/Brands";
  static const String apiSearchCars = "Car/GetAllCars";
  static const String apiInsuranceCompanies = "Companies/GetAllInsurance";
  static const String apiMaintenanceCompanies = "Companies/maintenance";
  static const String apiRescueCompanies = "Companies/RescueCompany";
  static const String apiCarShowrooms = "Dealership/GetAllDealership";
  static const String apiAllShowroomCars = "Car/GetAllCars?dealershipId";
  static const String apiCarsDetails = "Car";
  static const String apiUserAdvertisements = "Advertisement/my-advertisements";
  static const String apiDeleteUserAdvertisement = "Advertisement";

  static const String apiSellNewCar = "Car/CreateNewCar";
  static const String apiSellUsedCar = "Car/CreateUsedCar";
  static const String apiSellPersonalCar = "Advertisement/create";

  static const String apiLogin = "Account/login";
  static const String apiSignup = "Account/register";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
