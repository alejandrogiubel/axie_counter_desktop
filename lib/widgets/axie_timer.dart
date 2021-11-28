import 'dart:async';

import 'package:flutter/material.dart';

class AxieTimer extends StatefulWidget {
  const AxieTimer({Key? key}) : super(key: key);

  @override
  State<AxieTimer> createState() => _AxieTimerState();
}

class _AxieTimerState extends State<AxieTimer> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds < 0) {
          timer.cancel();
        } else {
          seconds = seconds + 1;
          if (seconds > 59) {
            minutes += 1;
            seconds = 0;
            if (minutes > 59) {
              hours += 1;
              minutes = 0;
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$hours : $minutes : $seconds');
  }
}
