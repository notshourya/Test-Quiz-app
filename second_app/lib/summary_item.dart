import 'package:flutter/material.dart';
import 'package:second_app/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, Key? key}) : super(key: key);

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final String userAnswer = itemData['user_answers'] as String;
    final String correctAnswer = itemData['correct_answers'] as String;
    final bool isCorrectAnswer = userAnswer == correctAnswer;

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
              Text(
                itemData['question'] as String,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  'Correct Answer: $correctAnswer',
                  style: const TextStyle(
                    color: Color.fromARGB(239, 7, 226, 153),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Your Answer: $userAnswer',
                  style: TextStyle(
                    color: isCorrectAnswer
                        ? const Color.fromARGB(239, 7, 226, 153)
                        :const Color.fromARGB(194, 246, 77, 65),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
