//Savastano Lorenzo 5CIA
//main del programma
import 'package:flutter/material.dart';
import 'todo.dart';
import 'SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Savastano Lorenzo 5CIA'),
      routes: {
        '/secondscreen': (ctx) =>
            SecondScreen(), //percorso per il passaggio alla seconda schermata
      },
    );
  }
}

//creazione classe che visualizza la lista a schermo
class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos}); //seconda schermata
  final List<Todo> todos; //creazione lista di todo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
        ),
        body: ListView.builder(
          //creazione della listview
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
            );
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//funzioni della pagina
class _MyHomePageState extends State<MyHomePage> {
  //generazione della lista
  final todos = List.generate(
    10,
    (i) => Todo(
      'Todo $i',
      'a description for the todo n. $i',
    ),
  );
  //funzione per eliminare gli elementi della lista
  void _deleteItem(Todo t) {
    setState(() {
      todos.remove(t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.of(context).pushNamed('/secondscreen', arguments: {
                'todo': todos[index], //elemento passato
                'handler': _deleteItem, //azione passata
              });
            },
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
