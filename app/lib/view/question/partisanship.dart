import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class PartisanshipQuestion implements Question {
  @override
  String get title => 'What is your partisanship?';

  @override
  String get key => 'partisanship';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    return Column(
      children: <String>[
            "Strong Democrat",
            "Not so strong Democrat",
            "Independent leaning Democrat",
            "Independent",
            "Independent leaning Republican",
            "Not so strong Republican",
            "Strong Republican",
            "Other",
        ]
          .map((String value) => RadioListTile<String>(
                title: Text(value),
                value: value,
                groupValue: currentValue,
                onChanged: onValueChange,
              ))
          .toList(),
    );
  }
}