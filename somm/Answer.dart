//Savastano Lorenzo 5CIA
import 'package:flutter/material.dart'; //il 'material' ci consente di usare la matirial di google

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.text,
    required this.action,
    required this.correct,
  });

  final String text;
  final Function() action;
  final bool correct;

  static var ok = 'false';

  @override
  Widget build(BuildContext context) {
    return Container(
      // left, top, right, bottom padding:
      padding: EdgeInsets.fromLTRB(2, 0, 2, 4),
      child: InkWell(
          child: Image.asset(
            text,
          ),
          onTap: () {
            String result = '';
            if (correct) {
              result = 'assets/OK2.png';
            } else {
              result = 'assets/wrong.png';
            }
            showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (ctx) => AlertDialog(
                content: InkWell(
                  onTap: () {
                    action();
                    Navigator.of(ctx).pop(true);
                  },
                  child: Image.asset(result),
                ),
              ),
            );
          }),
    );
  }
}
