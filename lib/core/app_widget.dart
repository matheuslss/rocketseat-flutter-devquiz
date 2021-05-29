import 'package:flutter/material.dart';
import 'package:nlw5_app/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'DevQuiz', home: SplashPage());
  }
}
