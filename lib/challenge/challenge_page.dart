import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/challenge_controller.dart';
import 'package:nlw5_app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5_app/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw5_app/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw5_app/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  ChallengePage({
    Key? key,
    required this.questions,
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
      Navigator.pop(context);
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
                onChange: nextPage,
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
