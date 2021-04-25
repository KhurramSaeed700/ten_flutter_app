import 'package:flutter/material.dart';
import 'package:ten_flutter_app/count_down_timer/timer02.dart';
import 'package:ten_flutter_app/count_down_timer/timerStopwatch03.dart';
import 'package:ten_flutter_app/count_down_timer/test.dart';

import 'Quiz App/quiz_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // home: second_timer(), //second attempt at timer app
      // home: timerStopwatch(), // timer and stopwatch

      home: QuizApp(),

      // home: MyHomePage(),
    );
  }
}
