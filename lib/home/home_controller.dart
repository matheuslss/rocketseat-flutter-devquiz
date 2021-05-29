import 'package:nlw5_app/core/core.dart';
import 'package:nlw5_app/home/home_state.dart';
import 'package:nlw5_app/shared/models/awnser_model.dart';
import 'package:nlw5_app/shared/models/question_model.dart';
import 'package:nlw5_app/shared/models/quiz_model.dart';
import 'package:nlw5_app/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
        name: "Matheus",
        photoUrl: "https://avatars.githubusercontent.com/u/47352591?v=4");

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          quetionAwnsered: 1,
          questions: [
            QuestionModel(title: "Está curtindo o Flutter:", awnsers: [
              AwnserModel(title: "Estou curtindo", isRight: true),
              AwnserModel(title: "Muito bom"),
              AwnserModel(title: "Top"),
              AwnserModel(title: "Show de bole"),
            ]),
            QuestionModel(title: "Está curtindo a Rocketseast:", awnsers: [
              AwnserModel(title: "Estou curtindo", isRight: true),
              AwnserModel(title: "Muito bom"),
              AwnserModel(title: "Top"),
              AwnserModel(title: "Show de bole"),
            ])
          ],
          imagem: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
