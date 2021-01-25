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

  List<Icon> icon = [];
  void addicon(bool option) {
    setState(() {
      if (quizbrain.getAnswer()==option) {
        icon.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        icon.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
    });
  }
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
                useranswer=true;
                addicon(useranswer);
                quizbrain.NextQuestion();
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
                useranswer=false;
                addicon(useranswer);
                quizbrain.NextQuestion();
              },
              child: Text("False"),
            ),
          ),
        ),
        Row(
          children: icon,
        )
      ],
    );
  }
}
