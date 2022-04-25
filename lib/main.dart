import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/counter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const BodyApp(),
      ),
      theme: ThemeData.dark(),
    );
  }
}

class BodyApp extends StatelessWidget {
  const BodyApp({
    Key? key,
  }) : super(key: key);

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
                children: const [
                  Text('Conteo de los números de clicks:'),
                  TextCounter(),
                ],
              ),
            ),
            const ButtonsForCounter(),
          ],
        ),
      ),
    );
  }
}

class ButtonsForCounter extends StatelessWidget {
  const ButtonsForCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('statement');
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return Row(
          children: [
            FloatingActionButton(
              child: const Icon(Icons.exposure_zero),
              onPressed: () {
                debugPrint('$state');
                context.read<CounterBloc>().add(ByZeroCounterEvent());
              },
            ),
            Expanded(child: Container(height: 0)),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: state == 0
                  ? null
                  : () {
                      context.read<CounterBloc>().add(DrecrementCounterEvent());
                    },
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(IncrementCounterEvent());
              },
            ),
          ],
        );
      },
    );
  }
}

class TextCounter extends StatelessWidget {
  const TextCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('build-text');
    return BlocBuilder<CounterBloc, int>(
      builder: (context, count) {
        return Text(
          '$count',
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}
