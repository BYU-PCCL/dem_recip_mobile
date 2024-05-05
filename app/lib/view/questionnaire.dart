import 'package:dem_recip_mobile/view/question/birth_year.dart';
import 'package:dem_recip_mobile/view/question/gender.dart';
import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:dem_recip_mobile/view/question/race.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _currentQuestionIndex = 0;
  String _value = '';
  Map<String, dynamic> _data = {};

  void _setAnswer(String question, String answer) {
    setState(() {
      _data[question] = answer;
    });
  }

  final List<Question> _questions = [
    RaceQuestion(),
    GenderQuestion(),
    BirthYearQuestion()
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_questions[_currentQuestionIndex].title),
      contentPadding: const EdgeInsets.all(30),
      content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              _questions[_currentQuestionIndex].widget(
                context,
                _value,
                (newValue) {
                  _value = newValue!;
                  _setAnswer(_questions[_currentQuestionIndex].title, newValue);
                },
              ),
            ],
          ),
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
      // _data[_questions[_currentQuestionIndex].key] = 
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Logic for submitting the questionnaire
      }
    });
  }
}