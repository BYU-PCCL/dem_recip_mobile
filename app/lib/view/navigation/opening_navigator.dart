import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/navigation/home_navigator.dart';
import 'package:dem_recip_mobile/view/question/birth_year.dart';
import 'package:dem_recip_mobile/view/question/gender.dart';
import 'package:dem_recip_mobile/view/question/partisanship.dart';
import 'package:dem_recip_mobile/view/question/question.dart';
import 'package:dem_recip_mobile/view/question/race.dart';
import 'package:dem_recip_mobile/view/questionnaire.dart';
import 'package:flutter/material.dart';

class OpeningNavigator extends StatefulWidget {
  @override
  _OpeningNavigatorState createState() => _OpeningNavigatorState();
}

class _OpeningNavigatorState extends State<OpeningNavigator> {

  bool showQuestionnaire = true;

  final List<Question> _questions = [
    RaceQuestion(),
    GenderQuestion(),
    BirthYearQuestion(),
    PartisanshipQuestion()
  ];


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: UserService.checkQuestionnaireCompletion(AuthService().currentUser?.email),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          bool? userState = snapshot.data;
          if (userState == false && showQuestionnaire) {
            return Stack(
              children: [
                const HomeNavigator(),
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {}, // Prevent taps on background from closing the dialog
                    child: Container(
                      color: Colors.black54, // Semi-transparent background
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Questionnaire(onComplete: (Map<String, dynamic> data) async {
                            await UserService.updateUser(AuthService().currentUser?.email, data);
                            setState(() {
                              showQuestionnaire = false;
                            });
                          }, questions: _questions, numberOfNavigatePops: 0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {            
            return const HomeNavigator();
          }
        }
      },
    );
  }
}
