import 'package:flutter/material.dart';
import 'package:world_clock/screens/home.dart';
import 'package:world_clock/screens/loading.dart';
import 'package:world_clock/screens/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'World Time', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location()
    });
  }
}
