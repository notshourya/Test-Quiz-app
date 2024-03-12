import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onTap,});

 final String answerText;
 final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
       foregroundColor: Colors.white, 
       backgroundColor: const  Color.fromARGB(65, 38, 2, 97)),
       child: Text(answerText,textAlign: TextAlign.center),
       );
}
}