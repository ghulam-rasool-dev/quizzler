import 'package:flutter/material.dart';
import 'quizbrain.dart';

Quizbrain quizbrain = Quizbrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Quizzler'),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {

  bool useranswer;
  int correct=0,wrong=0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Expanded(
          flex: 4,
          child: Center(
            child: Text(quizbrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  useranswer=true;
                  quizbrain.addicon(useranswer);
                  quizbrain.NextQuestion(context);
                });

              },
              child: Text("True"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  useranswer=false;
                  quizbrain.addicon(useranswer);
                  quizbrain.NextQuestion(context);
                });

              },
              child: Text("False"),
            ),
          ),
        ),
        Row(
          children: quizbrain.icon,
        )
      ],
    );
  }
}
