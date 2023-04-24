import 'package:flutter/material.dart';

class DrinkDataTextComponent extends StatelessWidget {
  const DrinkDataTextComponent({
    Key? key,
    this.drinkText,
    required this.title,
  }) : super(key: key);

  final String? drinkText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        "$title: ${drinkText ?? ""}",
      ),
    );
  }
}
