import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador',
      home: const BodyApp(),
      theme: ThemeData.dark(),
    );
  }
}

class BodyApp extends StatefulWidget {
  const BodyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyApp> createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (counter == 0) {
        return;
      }
      counter--;
    });
  }

  void _byZero() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build-bodyapp');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Conteo de los números de clicks:'),
                  TextCounter(counter: counter),
                ],
              ),
            ),
            Row(
              children: [
                FloatingActionButton(
                  child: const Icon(Icons.exposure_zero),
                  onPressed: () {
                    _byZero();
                  },
                ),
                Expanded(child: Container(height: 0)),
                FloatingActionButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    _decrement();
                  },
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    _increment();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
  const TextCounter({
    Key? key,
    required this.counter,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    debugPrint('build-text');
    return Text(
      '$counter',
      style: const TextStyle(fontSize: 20),
    );
  }
}
