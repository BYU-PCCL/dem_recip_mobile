import 'package:dem_recip_mobile/view/widget/add_button.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: <Widget>[
          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: List.generate(
                50,
                (index) => ListTile(
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('Subtitle for item ${index + 1}'),
                ),
              ),
            ),
          ),
          const AddButton()
        ]
      )
    );
  }
}