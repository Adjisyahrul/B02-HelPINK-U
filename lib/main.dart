import 'package:flutter/material.dart';
import 'package:helpink_u/login/login.dart';
import 'package:helpink_u/common/network_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'HomePage';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        NetworkService request = NetworkService();

        return request;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: new Color(0xFFC37B89),
        ),
        title: title,
        home: LoginPage(),
      ));
  }
}