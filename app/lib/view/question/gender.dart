import 'package:flutter/material.dart';

enum Gender { male, female, other }

class GenderQuestion extends StatefulWidget {
  const GenderQuestion({super.key});

  @override
  State<GenderQuestion> createState() => _GenderQuestionState();
}

class _GenderQuestionState extends State<GenderQuestion> {
  Gender? _character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<Gender>(
          title: const Text('Male'),
          value: Gender.male,
          groupValue: _character,
          onChanged: (Gender? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<Gender>(
          title: const Text('Female'),
          value: Gender.female,
          groupValue: _character,
          onChanged: (Gender? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<Gender>(
          title: const Text('Other'),
          value: Gender.other,
          groupValue: _character,
          onChanged: (Gender? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}


    