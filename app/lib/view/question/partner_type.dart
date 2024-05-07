import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class PartnerTypeQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => 'What type of partner would you like to be paired with?';

  @override
  String get key => 'partner_type';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange, Function(bool?) setValid) {
    return Column(
      children: <String>['Bot', 'Human']
          .map((String value) => RadioListTile<String>(
                title: Text(value),
                value: value.toLowerCase(),
                groupValue: currentValue,
                onChanged: (text) {
                  onValueChange(text);
                  setValid(text != '' || text != null);
                },
              ))
          .toList(),
    );
  }
}


    