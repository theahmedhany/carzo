import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/favorite_car_model.dart';

class FavoriteCubit extends Cubit<List<FavoriteCarModel>> {
  FavoriteCubit() : super([]);

  static const String favoriteKey = "favorite_cars";

  void loadFavorites() async {
    final favoritesJson = await SharedPrefHelper.getString(favoriteKey);
    if (favoritesJson.isNotEmpty) {
      try {
        final List<dynamic> decodedJson = json.decode(favoritesJson);
        final favorites =
            decodedJson.map((json) => FavoriteCarModel.fromJson(json)).toList();
        emit(favorites);
      } catch (e) {
        emit([]);
      }
    } else {
      emit([]);
    }
  }

  void toggleFavorite(FavoriteCarModel car) async {
    final currentFavorites = List<FavoriteCarModel>.from(state);
    final index = currentFavorites.indexWhere(
      (favorite) => favorite.carId == car.carId,
    );

    if (index >= 0) {
      currentFavorites.removeAt(index);
    } else {
      currentFavorites.add(car);
    }

    final jsonString = json.encode(
      currentFavorites.map((car) => car.toJson()).toList(),
    );
    await SharedPrefHelper.setData(favoriteKey, jsonString);
    emit(currentFavorites);
  }

  bool isFavorite(int carId) {
    return state.any((car) => car.carId == carId);
  }
}
