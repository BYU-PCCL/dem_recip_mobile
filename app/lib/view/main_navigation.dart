import 'package:dem_recip_mobile/service/user_service.dart';
import 'package:dem_recip_mobile/utils/auth_provider.dart';
import 'package:dem_recip_mobile/view/home_navigator.dart';
import 'package:dem_recip_mobile/view/questionnaire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatelessWidget {
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

          if (userState == false) {
            return Stack(
              children: [
                // Background: Home Screen
                const HomeNavigator(),
                // Overlay: Questionnaire Dialog
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      // Prevent taps on background from closing the dialog
                    },
                    child: Container(
                      color: Colors.black54, // Semi-transparent background
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Questionnaire(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // User state is not 1, display HomeScreen only
            return const HomeNavigator();
          }
        }
      },
    );
  }
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
