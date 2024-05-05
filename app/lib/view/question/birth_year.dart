import 'package:flutter/material.dart';

class BirthYearQuestion extends StatefulWidget {
  const BirthYearQuestion({Key? key}) : super(key: key);

  @override
  State<BirthYearQuestion> createState() => _BirthYearQuestionState();
}

class _BirthYearQuestionState extends State<BirthYearQuestion> {
  final TextEditingController yearBorn = TextEditingController();

  @override
  void dispose() {
    yearBorn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: yearBorn,
          decoration: const InputDecoration(
            labelText: 'Enter something',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
