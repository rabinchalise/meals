import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsProvider extends StateNotifier<List<Meals>> {
  FavoriteMealsProvider() : super([]);

  bool toogleMealFavorites(Meals meal) {
    final mealFavorites = state.contains(meal);
    if (mealFavorites) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealsProvider, List<Meals>>((ref) {
  return FavoriteMealsProvider();
});
