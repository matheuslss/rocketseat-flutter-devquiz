import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/challenge_controller.dart';
import 'package:nlw5_app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5_app/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw5_app/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw5_app/result/result_page.dart';
import 'package:nlw5_app/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    if (controller.currentPage == widget.questions.length)
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    title: widget.title,
                    length: widget.questions.length,
                    correctAnwsers: controller.correctAnwsers,
                  )));
  }

  void previousPage() {
    if (controller.currentPage > 1)
      pageController.previousPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
  }

  void pagination() {
    if (controller.currentPage == 1) Navigator.pop(context);

    if (controller.currentPage > 1) previousPage();
  }

  void onSelected(bool value) {
    if (value) controller.correctAnwsers++;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: pagination,
                          icon: controller.currentPage == 1
                              ? Icon(Icons.close)
                              : Icon(Icons.arrow_back)),
                      QuestionIndicatorWidget(
                        currentPage: value,
                        length: widget.questions.length,
                      ),
                    ],
                  )),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (quiz) => QuizWidget(
                question: quiz,
                onSelected: onSelected,
                // onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        value == widget.questions.length
                            ? Expanded(
                                child: NextButtonWidget.green(
                                    label: "Finalizar", onTap: nextPage))
                            : Expanded(
                                child: NextButtonWidget.green(
                                    label: "Próxima", onTap: nextPage)),
                      ],
                    ))),
      ),
    );
  }
}
