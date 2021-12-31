import 'package:flutter/material.dart';
import 'package:helpink_u/Screens/Welcome/tampilan%20welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelPINK U',
      theme: ThemeData(
        primaryColor: Color(0xFFF3F4ED),
        scaffoldBackgroundColor: Color(0xFFF3F4ED),
      ),
      home: WelcomeScreen(),
    );
  }
}
