import 'dart:async';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: camel_case_types
class timerStopwatch extends StatefulWidget {
  @override
  _timerStopwatchState createState() => _timerStopwatchState();
}

// ignore: camel_case_types
class _timerStopwatchState extends State<timerStopwatch>
    with TickerProviderStateMixin {
  int hour = 0;
  int min = 0;
  int sec = 0;
  bool started = true;
  bool stopped = false;
  int timeForTimer = 0;
  String timeToDisplay = '0';
  bool checkTimer = true;

  TabController tb;
  @override
  void initState() {
    tb = TabController(length: 2, vsync: this);
    super.initState();
  }

  void start() {
    setState(() {
      started = false;
      stopped = true;
    });
    timeForTimer = (hour * 3600) + (min * 60) + (sec);
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeForTimer < 1 || checkTimer == false) {
          t.cancel();
          checkTimer = true;
        } else {
          timeForTimer -= 1;
        }
        timeToDisplay = timeForTimer.toString();
      });
    });
  }

  void stop() {
    setState(() {
      started = true;
      stopped = false;
      checkTimer = false;
    });
  }

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'H',
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.w300),
                      ),
                      NumberPicker(
                        value: hour,
                        minValue: 0,
                        maxValue: 999,
                        itemWidth: 80,
                        onChanged: (val) {
                          setState(() {
                            hour = val;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'M',
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.w300),
                      ),
                      NumberPicker(
                        value: min,
                        minValue: 0,
                        maxValue: 59,
                        itemWidth: 80,
                        onChanged: (val) {
                          setState(() {
                            min = val;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'S',
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.w300),
                      ),
                      NumberPicker(
                        value: sec,
                        minValue: 0,
                        itemWidth: 80,
                        maxValue: 59,
                        onChanged: (val) {
                          setState(() {
                            sec = val;
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    timeToDisplay,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 50,
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: started ? start : null,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    color: Colors.green,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  RaisedButton(
                    onPressed: stopped ? stop : null,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    color: Colors.red,
                    child: Text(
                      'Stop',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timer App',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[
            Text('Timer'),
            Text('StopWatch'),
          ],
          labelPadding: EdgeInsets.only(bottom: 10),
          labelStyle: TextStyle(fontSize: 18),
          unselectedLabelColor: Colors.white54,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          Center(
              child: Text(
            'StopWatch',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w100),
          )),
        ],
        controller: tb,
      ),
    );
  }
}
