import 'package:flutter/material.dart';
import 'package:helpink_u/Screens/Welcome/tampilan%20welcome.dart';
import 'package:helpink_u/common/network_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        NetworkService request = NetworkService();

        return request;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HelPINK U',
        theme: ThemeData(
          primaryColor: Color(0xFFF3F4ED),
          scaffoldBackgroundColor: Color(0xFFF3F4ED),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
