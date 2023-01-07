import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: const Center(
        child: Text('History Page'),
      ),
    );
  }
}
