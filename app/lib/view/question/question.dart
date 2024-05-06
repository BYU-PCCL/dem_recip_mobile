import 'package:flutter/widgets.dart';

abstract class Question {
  String getTitle(Map<String, dynamic> data);
  String get key;
  bool get ignore {
    return false;
  }
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange);
}