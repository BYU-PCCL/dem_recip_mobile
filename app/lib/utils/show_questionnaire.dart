import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:dem_recip_mobile/view/questionnaire.dart';
import 'package:flutter/material.dart';

void showQuestionnaireDialog(
  BuildContext context, 
  bool showQuestionnaire,
  Function(Function()) setState,
  List<Question> questions
  ) async {
  await showDialog(
    context: context,
    barrierDismissible: false,  // Ensures the dialog must be explicitly dismissed by an action
    builder: (BuildContext dialogContext) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space that contents require
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false, // Don't automatically include a leading button
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Close the dialog
                  Navigator.of(context).pop(); // Navigate back in the main navigation context
                },
              ),
              title: const Text('Conversation Questions'),
              elevation: 0,
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
            ),
            Questionnaire(
              onComplete: () {
                Navigator.of(dialogContext).pop();  // Close the dialog
                setState(() {
                  showQuestionnaire = false; // Adjust the state as needed
                });
              },
              questions: questions,
            ),
          ],
        ),
      );
    },
  );
}