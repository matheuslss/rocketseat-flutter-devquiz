import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5_app/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw5_app/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw5_app/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(84),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
              QuestionIndicatorWidget(),
            ],
          )),
        ),
        body: QuizWidget(
          question: widget.questions[0],
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child:
                        NextButtonWidget.white(label: "Pular", onTap: () {})),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                    child: NextButtonWidget.green(
                        label: "Confirmar", onTap: () {})),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
