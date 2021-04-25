import 'package:flutter/material.dart';
import 'package:ten_flutter_app/Quiz%20App/question_screen.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(primarySwatch: Colors.blue),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Quiz App',
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                Text('Flutter Quiz',style: Theme.of(context).textTheme.headline2,),
                SizedBox(height: 100,),
                FlutterLogo(size: 350,),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuestionScreen()));
                  },
                      child: Text('Start Quiz')),
                ),
                SizedBox(height: 50,),

              ],
            ),
          ),
        ));
  }
}
