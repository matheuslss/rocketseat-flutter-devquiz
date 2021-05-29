import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          ...question.awnsers
              .map((answer) => AnswerWidget(
                    title: answer.title,
                    isRight: answer.isRight,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
