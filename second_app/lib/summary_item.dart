import 'package:flutter/material.dart';
import 'package:second_app/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final dynamic isCorrectAnswer =
        (itemData['user_answer'] == itemData['correct_answer']);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemData['question'] as String,
                  style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              )),
              const SizedBox(height: 10),
              Text("${itemData['user_answer'] ??""}" ,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 245, 0, 0))) ,
              Text("${itemData['correct_answer']??""}" ,
                  style: const TextStyle(
                      color: Color.fromARGB(176, 9, 255, 0))),
            ],
          ),
        ),
      ],
    );
  }
}
