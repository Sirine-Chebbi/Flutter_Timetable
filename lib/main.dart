import 'package:flutter/material.dart';
import 'screens/rooms_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RoomsScreen(),
    );
  }
}
