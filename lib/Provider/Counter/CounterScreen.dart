import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<CounterProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.getCountValue.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/timerScreen");
                  },
                  child: Text('Go to TimerScreen')),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().incrementCounter();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 20),
          // FloatingActionButton(
          //   onPressed: () {
          //     context.read<CounterProvider>().resetCounter();
          //   },
          //   child: Icon(Icons.restart_alt_rounded),
          // ),
          // SizedBox(width: 20),
          // FloatingActionButton(
          //   onPressed: () {
          //     context.read<CounterProvider>().decrementCounter();
          //   },
          //   child: Icon(Icons.remove),
          // ),
        ],
      ),
    );
  }
}
