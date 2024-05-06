import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class GenderQuestion implements Question {
  @override
  String get title => 'What gender do you identify as?';

  @override
  String get key => 'gender';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    return Column(
      children: <String>['Male', 'Female', 'Other']
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


    