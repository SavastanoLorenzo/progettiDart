//Savastano Lorenzo 5CIA
import 'package:flutter/material.dart'; //il 'material' ci consente di usare la matirial di google

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.text,
    required this.action,
    required this.check,
  });

  final String text;
  final Function() action;
  final String check;

  static var ok = 'false';

  String _control() {
    if (text == check) {
      ok = 'true';
    } else {
      ok = 'false';
    }
    return ok;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // left, top, right, bottom padding:
      padding: EdgeInsets.fromLTRB(2, 0, 2, 4),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (ctx) => AlertDialog(
                    title: Text('Check answers'),
                    content: Text('The answers is ' + _control()),
                    actions: <Widget>[
                      TextButton(
                          autofocus: true,
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                            action();
                          })
                    ],
                  ));
        },
        child: Text(text),
      ),
    );
  }
}
