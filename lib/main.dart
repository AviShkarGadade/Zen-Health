import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/entry_point.dart';
//import 'package:rive_animation/entry_point.dart';
import 'package:rive_animation/screen/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:rive_animation/screen/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user != null) {
              // User is signed in
              return EntryPoint(); // Navigate to the Home screen or wherever you want.
            } else {
              // User is not signed in
              return OnboardingScreen(); // Navigate to the Login screen.
            }
          } else {
            // Handle the loading state, e.g., show a loading spinner.
            return CircularProgressIndicator();
          }
        },
      ),

       
      
    );
  }
}

