import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/challenge_controller.dart';
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
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(pageController.hasClients.toString());
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
              ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => (QuestionIndicatorWidget(
                        currentPage: value,
                        length: widget.questions.length,
                      )))
            ],
          )),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: widget.questions
              .map((question) => QuizWidget(question: question))
              .toList(),
        ),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: NextButtonWidget.white(
                        label: "Pular",
                        onTap: () {
                          print("hasClients - " +
                              pageController.hasClients.toString());
                          print("initialPage - " +
                              pageController.initialPage.toString());
                          print("currentPage - " +
                              controller.currentPage.toString());
                          print("positions - " +
                              pageController.positions.toString());

                          pageController.nextPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.linear);
                        })),
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
