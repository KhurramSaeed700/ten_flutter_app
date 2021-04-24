import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  TextEditingController _minute;
  TextEditingController _second;
  Timer _timer;
  int totalTime;

  @override
  void initState() {
    super.initState();
    _minute = TextEditingController();
    _second = TextEditingController();
  }

  @override
  void dispose() {
    _minute.dispose();
    _second.dispose();
    super.dispose();
  }

  // void startTimer(){
  //   final oneSecond = Duration(seconds: 1);
  //   totalTime = _minute.text * 60 + _second.text;
  //   _timer = Timer.periodic(oneSecond, (timer) {
  //     setState(() {
  //       if ()
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.red,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Count Down Timer'),
        ),
        body: Center(
          child: Text(
              _minute.text == '' || _second.text == ''
                  ? '00:00'
                  : '${_minute.text}:${_second.text}',
              style: TextStyle(
                fontSize: 100,
                letterSpacing: 15,
                color: Colors.white,
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => Scaffold(
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Set Timer',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 40),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autocorrect: true,
                                keyboardType: TextInputType.number,
                                controller: _minute,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Minutes',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autocorrect: true,
                                keyboardType: TextInputType.number,
                                controller: _second,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Seconds',
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Start'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
          },
          child: Icon(Icons.timer),

          //  20:53 - 10 app in 10 hours video - 19/4/21
          //  39:33 - 10 app in 10 hours video - 20/4/21

        ),
      ),
    );
  }
}
