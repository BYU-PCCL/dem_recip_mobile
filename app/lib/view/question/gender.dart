import 'package:flutter/material.dart';

enum SingingCharacter { male, female, other }

class GenderQuestion extends StatefulWidget {
  const GenderQuestion({super.key});

  @override
  State<GenderQuestion> createState() => _GenderQuestionState();
}

class _GenderQuestionState extends State<GenderQuestion> {
  SingingCharacter? _character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('Male'),
          value: SingingCharacter.male,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Female'),
          value: SingingCharacter.female,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Other'),
          value: SingingCharacter.other,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}


    