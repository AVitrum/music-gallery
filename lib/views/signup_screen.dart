import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
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
            Text(
              'Welcome to',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Music Gallery',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () {
                MusicBackend().signUp();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/main', (route) => false);
              },
              icon: Icon(Icons.login),
              label: Text('Log in as a guest'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff1fd00f),
                onPrimary: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
