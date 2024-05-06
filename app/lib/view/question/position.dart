import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class PositionQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => 'What is your race?';

  @override
  String get key => 'race';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    return Column(
      children: <String>['White', 'Black', 'Hispanic', 'Asian', 'Other']
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