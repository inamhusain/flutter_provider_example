import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TimerInfo.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var timerInfo = Provider.of<TimerInfo>(context, listen: false);
      timerInfo.updateRemainingTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<TimerInfo>(
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value.getRemainingmin() <= 9
                      ? "0${value.getRemainingmin().toString()}"
                      : value.getRemainingmin().toString(),
                  style: TextStyle(fontSize: 60),
                ),
                SizedBox(width: 5.0),
                RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'MIN',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )),
                SizedBox(width: 5.0),
                Text(
                  " : ",
                  style: TextStyle(fontSize: 60),
                ),
                Text(
                  value.getRemainingsec() <= 9
                      ? "0${value.getRemainingsec().toString()}"
                      : value.getRemainingsec().toString(),
                  style: TextStyle(fontSize: 60, color: value.getColor()),
                ),
                SizedBox(width: 5.0),
                RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'SEC',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
