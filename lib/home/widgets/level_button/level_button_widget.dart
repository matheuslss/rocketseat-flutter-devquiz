import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlw5_app/home/widgets/level_button/config_button_colors.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({
    Key? key,
    required this.label,
  })  : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(
          key: key,
        );

  final config = ConfigLevelButton.buttonConfig();

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(BorderSide(color: borderColor))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
        child: Text(label,
            style: GoogleFonts.notoSans(color: fontColor, fontSize: 13)),
      ),
    );
  }
}
