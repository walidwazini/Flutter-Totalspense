import 'package:flutter/material.dart';
import 'package:totalspense/Screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        errorColor: Colors.red,
      ),
      title: 'Totalspens',
      home: HomeScreen(),
    );
  }
}
