import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning/pages/homepage.dart';

void main() {
  runApp(const App());
}

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 255, 97, 105),
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.poppinsTextTheme());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Homepage(),
    );
  }
}
