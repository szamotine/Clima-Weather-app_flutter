import 'package:clima/screens/loading_screen.dart';
import 'package:clima/services/mylocation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyLocation myLocation = MyLocation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(
        location: myLocation,
      ),
    );
  }
}
