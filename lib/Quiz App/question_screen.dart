import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Text('Quiz',style: Theme.of(context).textTheme.headline4,)
          ],
        ),
      ),
    );
  }
}
