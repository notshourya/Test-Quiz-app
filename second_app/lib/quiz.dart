import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/question_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/results_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz ({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
 List<String> selectedAnswers = [];
var activescreen ='start screen';

 switchScreen(){
  setState(() {
    activescreen = 'question-screen';
  });

 }

  void chooseAnswers(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length){
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  void restartQuiz (){
    setState((){
      selectedAnswers = [];
      activescreen ='questions-screen';
    });
  }

  
  @override
  Widget build (context){

   Widget screenWidget = StartScreen(switchScreen);
    if (activescreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectedAnswer: chooseAnswers,);
      }

    if(activescreen == 'result-screen'){
    screenWidget = ResultScreen(
      choosenAnswers: selectedAnswers,
      onRestart: restartQuiz,
    );
  }

    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 113, 0, 183),
                Color.fromARGB(248, 61, 0, 147),
                Color.fromARGB(251, 46, 1, 90),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}