import 'package:flutter/material.dart';


class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
            top: 0, // Positioned at the top within safe area
            right: 0, // Positioned on the right within safe area
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Adding some padding around the button
              child: FloatingActionButton(
                onPressed: () {
                  // Action when button is pressed
                  print('Plus button pressed');
                },
                child: const Icon(Icons.add), // Plus icon
              ),
            ),
          ),
        ],
      );
  }
}