import 'package:flutter/widgets.dart';

abstract class Question {
  String get title;
  Widget widget(BuildContext context, String currentValue, Function(String?) onValueChange);
}