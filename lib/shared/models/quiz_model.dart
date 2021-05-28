import 'package:nlw5_app/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int quetionAwnsered;
  final String imagem;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.quetionAwnsered = 0,
      required this.imagem,
      required this.level});
}
