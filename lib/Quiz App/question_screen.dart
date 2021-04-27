import 'package:flutter/material.dart';
import 'package:ten_flutter_app/Quiz%20App/quiz_app.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentOptionId=1;
  bool isCorrect=null;

  @override
  Widget build(BuildContext context) {
    final isCompleted=isCorrect!=null;

    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: <Widget>[
            Text(question.text,style: Theme.of(context).textTheme.headline4,),
            SizedBox(height: 10,),

            for (var option in question.options)
              RadioListTile<int>(value: option.id, groupValue: currentOptionId,title: Text(option.text), onChanged: (val){
                if(isCorrect==null)
                  setState(() {
                    currentOptionId=val;
                  });
              }),

            Spacer(),
            if(isCompleted)
              Text(isCorrect?'Your Right':'Your Wrong'),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                if(currentOptionId!=null)
                  setState(() {
                    isCorrect=currentOptionId==question.correctAnswerId;
                  });
              },
                  child: Text(isCompleted?'Continue':'Submit')),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}

final question = Question(
  text: 'What is the tallest building in the world?',
  correctAnswerId: 3,
  options: [
    Option(id: 1,text: 'Burj al arab'),
    Option(id: 2,text: 'Shanghai Tower'),
    Option(id: 3,text: 'Burj Khalifa'),
    Option(id: 4,text: 'Empire State'),

  ]
);

class Question{
  final String text;
  final int correctAnswerId;
  final List<Option> options;

  Question({this.text,this.correctAnswerId,this.options});
}

class Option{
  final int id;
  final String text;

  Option({this.id,this.text});
}

