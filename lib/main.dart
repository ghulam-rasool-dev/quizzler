import 'package:flutter/material.dart';

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
  int question=0;
  List<Icon> icon = [];
  List<String> questions=[
    'Crocodiles do not have sweat glands?',
    'Deficiency of Vitamin B17 leads to cancer?',
    'Does the human nucleus contain 46 pairs of chromosomes?',
  ];
  void addicon(int filter) {
    setState(() {
      if (filter == 1) {
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
            child: Text(questions[question],
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
                addicon(1);
                question++;
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
                addicon(2);
                question++;
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
