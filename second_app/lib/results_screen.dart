import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
 const ResultScreen ({super.key, required this.choosenAnswers, required this.onRestart});

 final void Function() onRestart;
 final List<String>choosenAnswers;

List<Map<String, Object>> getSummaryData(){
  final List<Map<String, Object>> summary = [];

  for (var i =0; i < choosenAnswers.length; i++){
      summary.add(
        {
        'question_index' : i,
        'question': questions[i].text,
        'correct_answers' : questions[i].answers[0],
        'user_answers' : choosenAnswers[i]
        },
      );

    }
    return summary;
  }
  
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectAnswers=summaryData.where((data){
      return data ['user_answers'] == data ['correct_answers'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!'
          , style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,),
          const SizedBox(height: 50),
          QuestionsSummary(summaryData: getSummaryData()),
          const SizedBox(height: 50),
          TextButton.icon(
            onPressed: onRestart, 
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz'), 
            ),
          ],    
        ),
      ),
    );
  }
}