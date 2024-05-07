import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:dem_recip_mobile/view/questionnaire.dart';
import 'package:flutter/material.dart';

void showQuestionnaireDialog(
  BuildContext context, 
  bool showQuestionnaire,
  Function(Function()) setState,
  List<Question> questions,
  Function(String? username, Map<String, dynamic>) serviceFunc
  ) async {
  await showDialog(
    context: context,
    barrierDismissible: false,  // Ensures the dialog must be explicitly dismissed by an action
    builder: (BuildContext dialogContext) {
      return Questionnaire(
        onComplete: (Map<String, dynamic> data) async {
          await serviceFunc(AuthService().currentUser?.email, data);
          Navigator.of(dialogContext).pop();
          setState(() {
            showQuestionnaire = false;
          });
        },
        questions: questions,
      );
    }
  );
}