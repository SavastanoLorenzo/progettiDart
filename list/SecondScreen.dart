//Savastano Lorenzo 5CIA
//implementazione della seconda schermata
import 'package:flutter/material.dart';
import 'todo.dart';
import 'button.dart';

class SecondScreen extends StatelessWidget {
  //creazione della classe
  const SecondScreen({Key? key}) : super(key: key); //costruttore

  @override
  Widget build(BuildContext context) {
    //override del metodo build per la costruzione della schermata
    final routeArgs = //passaggio dei dati
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final todo = routeArgs['todo'] as Todo;
    final handler = routeArgs['handler'] as Function(Todo);
    //creazione snackbar dopo la cancellazione
    void showSnackbar(String? text, int duration) {
      final String message = (text == null
          ? 'invalid message: ' + text.toString()
          : text.toString());
      final snackbar = SnackBar(
        duration: Duration(seconds: duration),
        content: Text(message),
        action: SnackBarAction(
          label: 'ok', //pulsante ok interno alla snack bar
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      );
      if (message != null && message.length > 0) {
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }

    //creazione impostazione pagina
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(todo.description),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    //schermata di dialogo per chiedere conferma di cancellazione
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Delete item'), //titolo
                          content: Text(
                              'Are you relly sure to delete item??'), //messaggio mostrato
                          actions: <Widget>[
                            //azione
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.of(ctx).pop(true),
                            ),
                            Button(
                                action: () {
                                  handler(todo);
                                  Navigator.pop(context);
                                  Navigator.of(ctx).pop(true);
                                  showSnackbar('Item ${todo.title} delete', 3);
                                },
                                text: 'delete'),
                          ],
                        ));
              },
              child: Text('delete'),
            )
          ],
        ),
      ),
    );
  }
}
