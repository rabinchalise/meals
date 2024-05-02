import 'package:flutter/material.dart';
import 'package:meals/extension.dart';
import 'package:meals/screens/meals_details.dart';
import 'package:meals/widgets/meals_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meals> meals;

  void _selectMeal(BuildContext context, Meals meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsDetails(
                  meal: meal,
                )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (_, index) => MealsItem(
        meal: meals[index],
        onSelectMeals: (meal) => _selectMeal(context, meal),
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(color: Theme.of(context).colorScheme.onBackground),
            ),
            16.0.verticalSpacer,
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              title!,
            ),
          ),
          body: content);
    }
  }
}
