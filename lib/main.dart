import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(SafeTrackApp());

class SafeTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeTrack',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
