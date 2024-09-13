//Savastano Lorenzo 5CIA
import 'package:flutter/material.dart'; //il 'material' ci consente di usare la matirial di google

var crt = 0;
var point = 0;

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.text,
    required this.check,
  });

  final String text;
  final String check;

  int _control() {
    if (check == 'false') {
      if (crt == 2) {
        point = point - 100;
        crt = 0;
      } else {
        crt++;
      }
    } else {
      point = point + 50;
      crt = 0;
    }
    return point;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // left, top, right, bottom padding:
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        width: double.infinity,
        child: Text(
          text + _control().toString(),
          textAlign: TextAlign.center,
        ));
  }
}
