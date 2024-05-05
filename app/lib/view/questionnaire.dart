import 'package:dem_recip_mobile/view/question/birth_year.dart';
import 'package:dem_recip_mobile/view/question/gender.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _currentQuestionIndex = 0;

  final List<Widget> _questions = [
    const GenderQuestion(),
    const BirthYearQuestion(),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
        child: _questions[_currentQuestionIndex],
      ),
      actions: [
        ElevatedButton(
          onPressed: _currentQuestionIndex > 0 ? _navigatePrevious : null,
          child: const Text("Previous"),
        ),
        ElevatedButton(
          onPressed: _navigateNext,
          child: Text(_currentQuestionIndex == _questions.length - 1 ? 'Submit' : 'Next'),
        ),
      ],
    );
  }

  void _navigatePrevious() {
    setState(() {
      _currentQuestionIndex--;
    });
  }

  void _navigateNext() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Logic for submitting the questionnaire
      }
    });
  }
}