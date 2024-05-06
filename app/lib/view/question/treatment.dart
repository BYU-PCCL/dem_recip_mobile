import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class GenderQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => 'Would you like to receive the treatment?';

  @override
  String get key => 'treatment';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    return Column(
      children: <String>['Yes', 'No']
          .map((value) => RadioListTile<String>(
                title: Text(value),
                value: value == "Yes" ? 'true' : 'false',
                groupValue: currentValue,
                onChanged: onValueChange,
              ))
          .toList(),
    );
  }
}