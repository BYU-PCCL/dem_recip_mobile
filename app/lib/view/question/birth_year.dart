import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class BirthYearQuestion implements Question {
  @override
  String get title => 'What year were you born in?';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    return Column(
      children: [
        TextField(
          onChanged: onValueChange,
          decoration: const InputDecoration(
            labelText: 'i.e. 1971',
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}