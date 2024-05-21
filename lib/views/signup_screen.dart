import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to'),
            Text('Music Galery'),
            ElevatedButton.icon(
                onPressed: () {
                  MusicBackend().signUp();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/main', (route) => false);
                },
                icon: Icon(Icons.login),
                label: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}
