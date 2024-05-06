import 'package:dem_recip_mobile/view/widget/add_button.dart';
import 'package:dem_recip_mobile/view/widget/conversation_box.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: List.generate(
                50,
                (index) => const ConversationBox()
              ),
            ),
          ),
          const AddButton()
        ]
      )
    );
  }
}