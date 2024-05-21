import 'package:flutter/material.dart';
import 'package:gallery_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gallery_app/theme.dart';
import 'package:gallery_app/views/components/login.dart';
import 'package:gallery_app/views/register.dart';
import 'package:gallery_app/views/signup_screen.dart';
import 'package:gallery_app/views/splash_screen.dart';

import 'views/home.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

const String appTitle = "Music Gallery App";

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeApp.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/main': (context) => Home(),
      },
    );
  }
}
