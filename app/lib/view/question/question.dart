import 'package:flutter/widgets.dart';

abstract class Question {
  String get title;
  String get key;
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange);
}