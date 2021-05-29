import 'package:flutter/material.dart';
import 'package:nlw5_app/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/home/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int correctAnwsers;
  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.correctAnwsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Container(
            padding: EdgeInsets.only(top: 80),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.trophy),
                Column(
                  children: [
                    Text(
                      "Parabéns!",
                      style: AppTextStyles.heading40,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text.rich(
                      TextSpan(
                          text: "Você concluiu ",
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                              text: "\n ${title} ",
                              style: AppTextStyles.bodyBold,
                            ),
                            TextSpan(
                                text:
                                    "\n com ${correctAnwsers} de ${length} acertos.",
                                style: AppTextStyles.body),
                          ]),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 68),
                            child: NextButtonWidget.purple(
                                label: "Compartilhar",
                                onTap: () {
                                  Share.share("DevQuiz NLW 5 - Flutter");
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 68),
                            child: NextButtonWidget.transparent(
                                label: "Voltar ao início",
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
