import 'package:bloc/bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/all_brands/all_brands_model.dart';
import '../../data/repos/all_brands_repo.dart';
import 'all_brands_state.dart';

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
