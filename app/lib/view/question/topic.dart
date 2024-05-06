import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:flutter/material.dart';

class TopicQuestion extends Question {
  @override
  String getTitle(Map<String, dynamic> data) => 'Choose a topic that you would like to have a conversation on.';

  @override
  String get key => 'topic';

  @override
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange) {
    const mapping = {'Abortion': 'abortion', "Gun Control": 'gun_control', 'Immigration': 'immigration'};

    return Column(
      children: <String>['Abortion', 'Gun Control', 'Immigration']
          .map((String value) => RadioListTile<String>(
                title: Text(value),
                value: mapping[value]!,
                groupValue: currentValue,
                onChanged: onValueChange,
              ))
          .toList(),
    );
  }
}