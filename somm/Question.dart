//Savastano Lorenzo 5CIA
import 'package:flutter/material.dart'; //il 'material' ci consente di usare la matirial di google

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
      ),
    );
  }
}
