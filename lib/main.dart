import 'package:flutter/material.dart';
import 'intro.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.redAccent,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0,fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
            fontSize: 20.0
          ),
            bodyText2: TextStyle(
                fontSize: 18.0
            ),
        ),
      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
