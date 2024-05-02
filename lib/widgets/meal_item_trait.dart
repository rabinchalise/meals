import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/extension.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Icon(
            icon,
            size: 17,
            color: Colors.white,
          ),
        ),
        6.0.hotizontalSpacer,
        Flexible(
          flex: 2,
          child: Text(
            overflow: TextOverflow.ellipsis,
            label,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
