import 'package:flutter/material.dart';
import 'package:gallery_app/theme.dart';

import 'views/home.dart';

void main() => runApp(const MyApp());

const String appTitle = "Music Gallery App";

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeApp.dark(),
      // ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      initialRoute: '/',
      routes: {'/': (context) => Home()},
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
