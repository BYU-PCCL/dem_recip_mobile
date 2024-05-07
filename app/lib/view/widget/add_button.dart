import 'package:dem_recip_mobile/service/user_convo_service.dart';
import 'package:dem_recip_mobile/utils/show_questionnaire.dart';
import 'package:dem_recip_mobile/view/question/consent.dart';
import 'package:dem_recip_mobile/view/question/partner_type.dart';
import 'package:dem_recip_mobile/view/question/position.dart';
import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:dem_recip_mobile/view/question/topic.dart';
import 'package:dem_recip_mobile/view/question/treatment.dart';
import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  _AddButtonState createState() => _AddButtonState();
}


class _AddButtonState extends State<AddButton> {
  bool showQuestionnaire = true;

  final List<Question> _questions = [
    ConsentQuestion(),
    TopicQuestion(),
    PositionQuestion(),
    TreatmentQuestion(),
    PartnerTypeQuestion()
  ];

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
                  showQuestionnaireDialog(
                    context, 
                    showQuestionnaire, 
                    setState, 
                    _questions, 
                    UserConvoService.create, 
                    1
                  );
                },
                child: const Icon(Icons.add), // Plus icon
              ),
            ),
          ),
        ],
      );
  }
}