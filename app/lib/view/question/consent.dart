import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class ConsentQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => """You are participating in a study on civic dialogue. Before proceeding please read the full details at this link. When you are ready to continue, respond with 'I consent to participate'""";

  @override
  String get key => 'consent';

  @override
  bool get ignore => true;

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    return Column(
      children: [
        TextField(
          onChanged: onValueChange,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}