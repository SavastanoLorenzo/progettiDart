//Savastano Lorenzo 5CIA
import 'package:flutter/material.dart'; //il 'material' ci consente di usare la matirial di google

class Question extends StatelessWidget {
  const Question({
    super.key,
    required this.quest,
  });

  final String quest;

  @override
  Widget build(BuildContext context) {
    return Container(
        // left, top, right, bottom padding:
        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        width: double.infinity,
        child: Text(
          quest,
          textAlign: TextAlign.center,
        ));
  }
}
