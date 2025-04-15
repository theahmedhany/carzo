import 'package:bloc/bloc.dart';
import 'package:carzo/core/networking/api_error_model.dart';
import 'package:carzo/core/networking/api_network_exceptions.dart';
import 'package:carzo/features/recommend_for_you/data/models/all_cars_model.dart';
import 'package:carzo/features/recommend_for_you/data/repos/all_cars_repo.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_state.dart';

class AllCarsCubit extends Cubit<AllCarsState<List<AllCarsModel>>> {
  final AllCarsRepo allCarsRepo;

  AllCarsCubit(this.allCarsRepo) : super(const Idle());

  void emitGetAllCars() async {
    var data = await allCarsRepo.getAllCars();

    data.when(
      success: (List<AllCarsModel> allCarsList) {
        emit(AllCarsState.success(allCarsList));
      },
      failure: (ApiErrorModel apiError) {
        emit(AllCarsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
