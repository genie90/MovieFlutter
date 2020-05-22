import 'package:flutter/material.dart';
import 'package:movieflutter/screens/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  ThemeData themeData1 = ThemeData(
    primarySwatch: Colors.deepPurple,
  );

  ThemeData themeData2 = ThemeData(
    primaryColor: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData1,
      home: DashboardScreen()
    );
  }
}
