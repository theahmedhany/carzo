import 'package:bloc/bloc.dart';
import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/brands/data/models/brand_cars_model.dart';
import 'package:carzo/features/brands/data/repos/brand_cars_repo.dart';
import 'package:carzo/features/brands/manager/brand_cars_state.dart';

class BrandCarsCubit extends Cubit<BrandCarsState<List<BrandCarsModel>>> {
  final BrandCarsRepo brandCarsRepo;

  BrandCarsCubit(this.brandCarsRepo) : super(const Idle());

  void emitGetAllBrandCars(String selectedBrand) async {
    var data = await brandCarsRepo.getCarsByBrand(selectedBrand);

    data.when(
      success: (List<BrandCarsModel> brandCarsRepo) {
        emit(BrandCarsState.success(brandCarsRepo));
      },
      failure: (ApiErrorModel apiError) {
        emit(BrandCarsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
