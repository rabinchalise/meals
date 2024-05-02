import 'package:flutter/material.dart';

class MyTiles extends StatelessWidget {
  const MyTiles({
    super.key,
    required this.icon,
    required this.press,
    required this.text,
  });
  final IconData icon;
  final void Function() press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 24)),
    );
  }
}
