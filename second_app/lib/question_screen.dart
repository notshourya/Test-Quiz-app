import 'package:flutter/material.dart';
import 'package:second_app/answer_button.dart';
import 'package:second_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen ({super.key, required this.onSelectedAnswer});

    final void Function(String answer) onSelectedAnswer;

  @override 
  State<QuestionsScreen> createState(){
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionsScreen>{
var currentQuestionindex = 0;


void answerQuestion(String selectedAnswers) {
  widget.onSelectedAnswer(selectedAnswers);
  setState(() {
     currentQuestionindex ++;
  });
}
 
  @override
  Widget build (context){
final currentQuestion = questions[currentQuestionindex];

    return SizedBox(
      width: double.infinity,
      child:Container(
        margin: const EdgeInsets.all(60),
      child:Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children:  [
       Text(currentQuestion.text, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
       textAlign: TextAlign.center,),
      const SizedBox(height: 30),
      ...currentQuestion.getShuffledAnswers().map((answer) {
        return AnswerButton(answerText: answer, onTap: (){
          answerQuestion(answer);
        });
       }
      ),
     ],
    ),
   ),
  );
 }
}