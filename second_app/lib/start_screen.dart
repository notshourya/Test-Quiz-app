import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function () startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column (
        mainAxisSize: MainAxisSize.min,
        children: [
        Image.asset('assets/images/quiz-logo.png',width: 300, color:  const Color.fromARGB(239, 255, 255, 255)),
        const SizedBox(height: 70),
        const Text("Let's Learn Flutter!",
         style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),),
         const SizedBox(height: 25),
        OutlinedButton.icon( 
          onPressed: startQuiz,
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        label: const Text('Start Quiz'),
        icon: const Icon(Icons.arrow_right_alt_outlined, size: 18),
        ),
      ],
      ) ,
    );
  }
}