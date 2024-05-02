import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/extension.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_provider.dart';

class MealsDetails extends ConsumerWidget {
  const MealsDetails({
    super.key,
    required this.meal,
  });

  final Meals meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final isAdded = ref
                      .read(favoriteMealProvider.notifier)
                      .toogleMealFavorites(meal);

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.deepOrange[300],
                      content: Text(isAdded
                          ? 'Meal added as a Favorites!'
                          : 'Meal removed successfully!')));
                },
                icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: Tween<double>(begin: 0.8, end: 1)
                            .animate(animation),
                        child: child,
                      );
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.grey.shade300,
                      key: ValueKey(isFavorite),
                    )))
          ],
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: meal.id,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        meal.imageUrl,
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                24.0.verticalSpacer,
                Text(
                  'Ingridents',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.deepOrange[300],
                      fontWeight: FontWeight.bold),
                ),
                14.0.verticalSpacer,
                for (final ingrident in meal.ingredients)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '●',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black54),
                      ),
                      10.0.hotizontalSpacer,
                      Text(
                        ingrident,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                24.0.verticalSpacer,
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.deepOrange[300],
                      fontWeight: FontWeight.bold),
                ),
                14.0.verticalSpacer,
                for (final step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '●',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.black54),
                          ),
                          10.0.hotizontalSpacer,
                          Expanded(
                            child: Text(
                              step,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black54),
                            ),
                          ),
                        ]),
                  ),
              ],
            ),
          ),
        ));
  }
}
