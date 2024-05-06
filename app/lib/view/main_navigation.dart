import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/home_navigator.dart';
import 'package:dem_recip_mobile/view/questionnaire.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {

  bool showQuestionnaire = true;

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
                          child: Questionnaire(onComplete: () {
                            setState(() {
                              showQuestionnaire = false;
                            });
                          }),
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
