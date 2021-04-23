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

  TabController tb;
  @override
  void initState() {
    tb = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget timer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 80, 0, 20),
                      child: Text(
                        'H',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: NumberPicker(
                        value: hour,
                        minValue: 0,
                        maxValue: 23,
                        itemWidth: 80,
                        onChanged: (val) {
                          setState(() {
                            hour = val;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 80, 0, 20),
                      child: Text(
                        'M',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: NumberPicker(
                        value: min,
                        minValue: 0,
                        maxValue: 23,
                        itemWidth: 80,
                        onChanged: (val) {
                          setState(() {
                            min = val;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 80, 0, 20),
                      child: Text(
                        'S',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: NumberPicker(
                        value: sec,
                        minValue: 0,
                        itemWidth: 80,
                        maxValue: 23,
                        onChanged: (val) {
                          setState(() {
                            sec = val;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '1',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.green[700],
                  onPressed: (){},
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red[600],
                  onPressed: (){},
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
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
          Text('StopWatch'),
        ],
        controller: tb,
      ),
    );
  }
}
