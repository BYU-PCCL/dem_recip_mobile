import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  final Function(Map<String, dynamic> data) onComplete;
  final List<Question> questions;
  final int numberOfNavigatePops;

  const Questionnaire({super.key, required this.onComplete, required this.questions, required this.numberOfNavigatePops});

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _currentQuestionIndex = 0;
  String _value = '';
  bool _valid = false;
  Map<String, dynamic> _data = {};

  void _setAnswer(String question, String answer) {
    setState(() {
      _data[question] = answer;
    });
  }

@override
Widget build(BuildContext context) {
  return AlertDialog(
    titlePadding: const EdgeInsets.only(top: 20, bottom: 0, left: 10, right: 10),
    title: widget.numberOfNavigatePops > 0 ? Align(
      alignment: Alignment.centerLeft,
      child: widget.numberOfNavigatePops > 0 ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: widget.numberOfNavigatePops == 0 ? null : () {
          for (var i = 0; i < widget.numberOfNavigatePops; i++) {
            Navigator.of(context).pop();
          }
        }
      ): null,
    ) : null,
    contentPadding: EdgeInsets.only(top: widget.numberOfNavigatePops  > 0 ? 0 : 16, bottom: 16, left: 16, right: 16),
    content: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(widget.questions[_currentQuestionIndex].getTitle(_data), style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 20),
          widget.questions[_currentQuestionIndex].widget(
            context,
            _value,
            (newValue) {
              _value = newValue!;
              if (!widget.questions[_currentQuestionIndex].ignore) {
                _setAnswer(widget.questions[_currentQuestionIndex].key, newValue);
              }
            },
            (value) {
              setState(() {
                _valid = value!;
              });
            }
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
        onPressed: _valid ? _navigateNext : null,
        child: Text(_currentQuestionIndex == widget.questions.length - 1 ? 'Submit' : 'Next'),
      ),
    ],
  );
}

  void _navigatePrevious() {
    setState(() {
      _value = '';
      _valid = false;
    });
    setState(() {
      _currentQuestionIndex--;
    });
  }

  Future<void> _navigateNext() async {
    setState(() {
      _valid = false;
    });
    if (_currentQuestionIndex == widget.questions.length - 1) {
      try {
        
        await widget.onComplete(_data);
        
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