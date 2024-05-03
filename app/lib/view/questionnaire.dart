import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  String? gender;
  int? yearBorn;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestion("What is your gender?", [
              RadioListTile(
                title: const Text('Male'),
                value: 'male',
                groupValue: null, // Provide a value based on user selection
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Female'),
                value: 'female',
                groupValue: null, // Provide a value based on user selection
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Other'),
                value: 'other',
                groupValue: null, // Provide a value based on user selection
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            ]),
            const SizedBox(height: 20),
            _buildQuestion("In what year were you born?", [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Year of Birth',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birth year';
                  }
                  int year = int.tryParse(value) ?? 0;
                  if (year <= 0 || year >= 2024) {
                    return 'Please enter a valid birth year';
                  }
                  int age = DateTime.now().year - year;
                  if (age < 13 || age >= 100) {
                    return 'You must be between 13 and 99 years old';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    yearBorn = value as int?;
                  });
                },
              ),
            ]),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Widget _buildQuestion(String question, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...options,
      ],
    );
  }
}
