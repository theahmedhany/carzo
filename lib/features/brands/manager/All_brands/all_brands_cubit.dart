import 'package:bloc/bloc.dart';
import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/brands/data/models/all_brands/all_brands_model.dart';
import 'package:carzo/features/brands/data/repos/all_brands_repo.dart';
import 'package:carzo/features/brands/manager/All_brands/all_brands_state.dart';

class AllBrandsCubit extends Cubit<AllBrandsState<List<AllBrandsModel>>> {
  final AllBrandsRepo allBrandsRepo;

  AllBrandsCubit(this.allBrandsRepo) : super(const Idle());

  void emitGetAllBrands() async {
    var data = await allBrandsRepo.getAllBrands();

    data.when(
      success: (List<AllBrandsModel> allBrandsList) {
        emit(AllBrandsState.success(allBrandsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(
          AllBrandsState.error(
            ApiNetworkExceptions.fromApiErrorModel(apiError),
          ),
        );
      },
    );
  }
}
