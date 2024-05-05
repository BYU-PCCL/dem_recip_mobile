import 'package:dem_recip_mobile/view/question/gender.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: double.maxFinite,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GenderQuestion()
          ],
        ),
      ),
      // actions: [
      //   ElevatedButton(
      //     onPressed: () {
      //       _navigateNext();
      //     },
      //     child: Text(_currentQuestionIndex == _questions.length - 1 ? 'Submit' : 'Next'),
      //   ),
      // ],
    );
  }
    

  void _navigateNext() {
    // if (_currentQuestionIndex < _questions.length - 1) {
    //   setState(() {
    //     _currentQuestionIndex++;
    //   });
    // } else {
    //   // Handle submit action (e.g., validate and process questionnaire data)
    //   _submitQuestionnaire();
    //   Navigator.of(context).pop(); // Close the dialog after submission
    // }
  }

  void _submitQuestionnaire() {
    // // Implement logic to process questionnaire data
    // String gender = _questions[0]['selectedOption'];
    // int yearBorn = int.tryParse(_questions[1]['selectedOption'] ?? '') ?? 0;

    // // Print or process collected data
    // print('Gender: $gender');
    // print('Year of Birth: $yearBorn');
  }
}
