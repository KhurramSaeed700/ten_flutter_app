import 'package:flutter/material.dart';
import 'package:ten_flutter_app/count_down_timer/countDownTimer.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CountDownTimmer(),
    );
  }
}