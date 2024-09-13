//Savastano Lorenzo 5CIA
//classe che implementa il bottone di delete
import 'package:flutter/material.dart'; //il 'material' ci consente di usare la matirial di google

class Button extends StatelessWidget {
  const Button({
    //costruttore
    super.key,
    required this.text,
    required this.action,
  });

  final String text;
  final Function() action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: action, child: Text(text));   //build che costruisce il bottone 
  }
}
