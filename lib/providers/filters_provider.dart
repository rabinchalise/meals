import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meal_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FliterProvider extends StateNotifier<Map<Filter, bool>> {
  FliterProvider()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFiltered(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilters(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed as we are mutating state in memeory

    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FliterProvider, Map<Filter, bool>>(
    (ref) => FliterProvider());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeMeals = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeMeals[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeMeals[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeMeals[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeMeals[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
