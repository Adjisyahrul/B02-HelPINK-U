import 'package:flutter/material.dart';
import 'package:helpink_u/profil/api.dart';
import 'package:helpink_u/profil/data_diri.dart';
import 'package:provider/provider.dart';
import 'package:helpink_u/profil/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileAPI(),
      child: MaterialApp(
        title: 'HelPINK U',
        theme: ThemeData(
          primarySwatch: myColor1,
        ),
        home: UserProfile(),
      ),
    );
  }
}

const MaterialColor myColor1 = MaterialColor(0xFFC37B89, <int, Color>{
  50: Color(0xFFC37B89),
  100: Color(0xFFC37B89),
  200: Color(0xFFC37B89),
  300: Color(0xFFC37B89),
  400: Color(0xFFC37B89),
  500: Color(0xFFC37B89),
  600: Color(0xFFC37B89),
  700: Color(0xFFC37B89),
  800: Color(0xFFC37B89),
  900: Color(0xFFC37B89),
});
//const SecondaryColor =  Color(0xFFF3F4ED);
const MaterialColor myColor2 = MaterialColor(0xFFF3F4ED, <int, Color>{
  50: Color(0xFFF3F4ED),
  100: Color(0xFFF3F4ED),
  200: Color(0xFFF3F4ED),
  300: Color(0xFFF3F4ED),
  400: Color(0xFFF3F4ED),
  500: Color(0xFFF3F4ED),
  600: Color(0xFFF3F4ED),
  700: Color(0xFFF3F4ED),
  800: Color(0xFFF3F4ED),
  900: Color(0xFFF3F4ED),
});
