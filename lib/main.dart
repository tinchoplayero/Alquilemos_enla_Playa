import '/services/user_prefs.dart';
import 'package:authentication_repository/authentication_repository.dart';  

import '/app/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  await UserPreferences().initPrefs();

  runApp(App(authenticationRepository: authenticationRepository));
  
}

