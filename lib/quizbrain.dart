import 'package:quizzler/question.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizbrain {
  int _question=0,correct=0,wrong=0;
  List<Question> _input_data = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('.In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];
  List<Icon> icon = [];
  void addicon(bool useranswer) {
      if (getAnswer()==useranswer) {
        icon.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        correct++;
      } else {
        icon.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        wrong++;
      }
  }
  void NextQuestion(BuildContext context){
    if(_question<_input_data.length-1)
      _question++;
    else{
      _question=0;
      this.icon.clear();
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Quiz Ended",
        desc: "Correct : $correct\nWrong: $wrong",
        buttons: [
          DialogButton(
            child: Text(
              "Cool",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
          DialogButton(
            child: Text(
              "Start Again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            gradient: LinearGradient(colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ]),
          )
        ],
      ).show();
      correct=wrong=0;
    }
  }
  String getQuestionText(){
    return _input_data[_question].QuestionText;
  }
  bool getAnswer(){
    return _input_data[_question].answer;
  }
}
