import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';

var _counter = 0;

void incrementandoONumero() {
  var dateTime = DateTime.now();

  print('Incrementando o número $dateTime - $_counter');

  _counter++;
}

void main() {
  Timer.periodic(
    const Duration(seconds: 5),
    (Timer t) => incrementandoONumero(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => atualizandoOValor(),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  atualizandoOValor() {
    setState(() {});
  }
}
