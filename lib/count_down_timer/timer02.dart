import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class second_timer extends StatefulWidget {
  @override
  _second_timerState createState() => _second_timerState();
}

class _second_timerState extends State<second_timer> {
  double percent = 0;
  static int timeInMin = 25;
  int timeInSec = timeInMin * 60;
  Timer timer;

  _startTimer() {//the logic
    timeInMin = 25;
    int time = timeInMin * 60;
    double secPercent = (time / 100);
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(time>0) {
          time--;
          if (time % 60 == 0) { //a minute has passed
            timeInMin--;
          }
          if (time % secPercent ==
              0) { //we want to see 1% is equal to how many seconds for our progress bar
            if (percent < 1) {
              percent += 0.01;
            } else {
              percent = 1;
            }
          }
        }else{
          percent=0.0;
          timeInMin=25;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue[900], Colors.blueAccent],
                  begin: FractionalOffset(0.3, 1))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Timer Clock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 250,
                  lineWidth: 20,
                  progressColor: Colors.white,
                  center: Text(
                    '$timeInMin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Study Timer',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '25',
                                      style: TextStyle(
                                        fontSize: 70,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Pause Timer',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '5',
                                      style: TextStyle(
                                        fontSize: 70,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: RaisedButton(
                            onPressed: _startTimer,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                'Start Timer',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
