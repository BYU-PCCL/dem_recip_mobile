import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/home_navigator.dart';
import 'package:dem_recip_mobile/view/questionnaire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkQuestionnaireCompletion(), // Fetch questionnaire completion status
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator while fetching status
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Handle error
          } else {
            bool isQuestionnaireCompleted = snapshot.data ?? false;

            if (isQuestionnaireCompleted) {
              return const HomeNavigator(); // Proceed to main app content
            } else {
              return const Questionnaire(); // Display questionnaire
            }
          }
        }
      },
    );
  }

  Future<bool> checkQuestionnaireCompletion() async {
    try {
      User? curUser = AuthService().currentUser;
      bool isCompleted = await UserService.checkQuestionnaireCompletion(curUser?.email);

      return isCompleted;
    } catch (e) {
      // Handle API error
      print('Error checking questionnaire completion: $e');
      throw e; // Rethrow the error for the FutureBuilder to handle
    }
  }
}
