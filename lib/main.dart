import 'package:flutter/material.dart';
import 'main_scaffold.dart'; // 1. Import your scaffold file

void main() {
  runApp(const StudyMateApp());
}

class StudyMateApp extends StatelessWidget {
  const StudyMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudyMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      // 2. Set MainScaffold as the root screen
      home: const MainScaffold(),
    );
  }
}