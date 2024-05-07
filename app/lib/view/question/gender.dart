import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class GenderQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => 'What gender do you identify as?';

  @override
  String get key => 'gender';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange, Function(bool?) setValid) {
    return Column(
      children: <String>['Male', 'Female', 'Other']
          .map((String value) => RadioListTile<String>(
                title: Text(value),
                value: value,
                groupValue: currentValue,
                onChanged: (text) {
                  onValueChange(text);
                  setValid(text != '' || text != null);
                }
              ))
          .toList(),
    );
  }
}


    