import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class PositionQuestion extends Question {
  
  @override
  String getTitle(Map<String, dynamic> data) {
    const titles = {
      "abortion": """Some people feel that abortion should always be legal. Suppose these people are at one end of a scale, at point 1. Others think that abortion should never be legal. Suppose these people are at the other end of the scale, at point 6. Some people are in between, at points 2, 3, 4, and 5.\n\nAt what number would you place yourself on this scale?""",
      "gun_control": """Some people think that the government should make it much more difficult for people to buy a gun. Suppose these people are at one end of a scale, at point 1. Others feel that the government should make it much easier to buy a gun. Suppose these people are at the other end of the scale, at point 6.\nSome people are in between, at points 2, 3, 4, and 5.\n\nAt what number would you place yourself on this scale?""",
      "immigration": """Some people think that the government should provide a path for all unauthorized immigrants to become citizens. Suppose these people are at one end of a scale, at point 1. Others feel that all unauthorized immigrants should be returned to their native countries. Suppose these people are at the other end of the scale, at point 6. Some people are in between, at points 2, 3, 4, and 5.\n\nAt what number would you place yourself on this scale?"""
    };
    return titles[data['topic']]!;
  }

  @override
  String get key => 'stance';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange, Function(bool?) setValid) {
    return Column(
      children: <String>['1', '2', '3', '4', '5', '6']
          .map((String value) => RadioListTile<String>(
                title: Text(value),
                value: value,
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