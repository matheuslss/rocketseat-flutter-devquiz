import 'package:nlw5_app/core/core.dart';

class ConfigLevelButton {
  static Map buttonConfig() {
    return {
      "Fácil": {
        "color": AppColors.levelButtonFacil,
        "borderColor": AppColors.levelButtonBorderFacil,
        "fontColor": AppColors.levelButtonTextFacil
      },
      "Médio": {
        "color": AppColors.levelButtonMedio,
        "borderColor": AppColors.levelButtonBorderMedio,
        "fontColor": AppColors.levelButtonTextMedio
      },
      "Difícil": {
        "color": AppColors.levelButtonDificil,
        "borderColor": AppColors.levelButtonBorderDificil,
        "fontColor": AppColors.levelButtonTextDificil
      },
      "Perito": {
        "color": AppColors.levelButtonPerito,
        "borderColor": AppColors.levelButtonBorderPerito,
        "fontColor": AppColors.levelButtonTextPerito
      },
    };
  }
}
