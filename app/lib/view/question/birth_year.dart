import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class BirthYearQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => 'What year were you born in?';

  @override
  String get key => 'yearBorn';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange, Function(bool?) setValid) {
    
    bool isNumeric(String str) {
      if (str.isEmpty) {
        return false;
      }
      return int.tryParse(str) != null;
    }
    
    void validateBirthYear(String value) {
      if (isNumeric(value)) {
        int year = int.parse(value);
        int currentYear = DateTime.now().year;
        int age = currentYear - year;
        if (age > 10 && age < 120) {
          setValid(true);
          return;
        }
      }
      setValid(false);
    }

    return Column(
      children: [
        TextField(
          onChanged: (text) {
            onValueChange(text);
            validateBirthYear(text);
          },
          decoration: const InputDecoration(
            labelText: 'i.e. 1971',
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}