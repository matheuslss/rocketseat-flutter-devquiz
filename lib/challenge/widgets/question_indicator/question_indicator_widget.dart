import 'package:flutter/material.dart';
import 'package:nlw5_app/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Questão 04"), Text("de 10")],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: 0.7)
        ],
      ),
    );
  }
}