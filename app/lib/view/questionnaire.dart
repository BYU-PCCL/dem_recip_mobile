import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/question/birth_year.dart';
import 'package:dem_recip_mobile/view/question/gender.dart';
import 'package:dem_recip_mobile/view/question/partisanship.dart';
import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:dem_recip_mobile/view/question/race.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  final Function() onComplete;

  const Questionnaire({super.key, required this.onComplete});

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
    BirthYearQuestion(),
    PartisanshipQuestion()
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
                  _setAnswer(_questions[_currentQuestionIndex].key, newValue);
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

  Future<void> _navigateNext() async {
    if (_currentQuestionIndex == _questions.length - 1) {
      try {

        await UserService.updateUser(AuthService().currentUser?.email, _data);

        widget.onComplete();
        
      } catch (e) {
        _showErrorDialog(e.toString());
      }
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}