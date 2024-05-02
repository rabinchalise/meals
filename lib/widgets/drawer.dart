import 'package:flutter/material.dart';
import 'package:meals/extension.dart';

import 'my_tiles.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.deepOrange,
                    Colors.deepOrange[300]!,
                  ])),
              child: Row(
                children: [
                  const Icon(Icons.fastfood, size: 48, color: Colors.white),
                  18.0.hotizontalSpacer,
                  Text(
                    'Cooking up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: Colors.white),
                  )
                ],
              )),
          MyTiles(
            icon: Icons.restaurant,
            press: () {
              onSelectScreen('meals');
            },
            text: 'Meals',
          ),
          MyTiles(
            icon: Icons.settings,
            press: () {
              onSelectScreen('filters');
            },
            text: 'Filters',
          )
        ],
      ),
    );
  }
}
