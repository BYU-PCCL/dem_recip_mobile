import 'package:flutter/widgets.dart';

class Question {
  final Widget _widget;
  final String _title;

  Question(this._widget, this._title);

  Widget get widget => _widget;

  String get title => _title;
}