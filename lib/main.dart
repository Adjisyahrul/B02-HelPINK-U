import 'package:flutter/material.dart';
import 'package:helpink_u/Screens/Welcome/tampilan%20welcome.dart';
import 'package:helpink_u/common/network_service.dart';
import 'package:helpink_u/saran/main_view_saran.dart';
import 'package:provider/provider.dart';
import 'saran/main_form_saran.dart';
import 'saran/main_form_saran.dart';
import 'login/login.dart';
import 'profil/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        NetworkService request = NetworkService();

        return request;
      },
      child: MaterialApp(
        title: 'HelPINK U',
        theme: ThemeData(
          primarySwatch: myColor1,
        ),
        home: MyHomePage(title: 'HelPINK U'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text(widget.title, style: const TextStyle(color: myColor2)),
        ),
        body:
            WelcomeScreen(), //CarouselHome()HomeDonatur()FormSaran()KritikAdmin()HomePengaju()SaranProvide()HomeAdmin()SaranProvide()FormProvide()LoginPage()FormProvide()
        backgroundColor: myColor2);
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

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
      
//       create: (_) {
//         NetworkService request = NetworkService();

//         return request;
//       },
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'HelPINK U',
//         theme: ThemeData(
//           primaryColor: myColor1
//         ),
//         home: WelcomeScreen(), 
//       ),
//     );
//   }
// }

// const MaterialColor myColor1 =  MaterialColor(
//     0xFFC37B89,
//     <int, Color>{
//       50: Color(0xFFC37B89),
//       100: Color(0xFFC37B89),
//       200: Color(0xFFC37B89),
//       300: Color(0xFFC37B89),
//       400: Color(0xFFC37B89),
//       500: Color(0xFFC37B89),
//       600: Color(0xFFC37B89),
//       700: Color(0xFFC37B89),
//       800: Color(0xFFC37B89),
//       900: Color(0xFFC37B89),
//     }
// );
// //const SecondaryColor =  Color(0xFFF3F4ED);
// const MaterialColor myColor2 =  MaterialColor(
//     0xFFF3F4ED,
//     <int, Color>{
//       50: Color(0xFFF3F4ED),
//       100: Color(0xFFF3F4ED),
//       200: Color(0xFFF3F4ED),
//       300: Color(0xFFF3F4ED),
//       400: Color(0xFFF3F4ED),
//       500: Color(0xFFF3F4ED),
//       600: Color(0xFFF3F4ED),
//       700: Color(0xFFF3F4ED),
//       800: Color(0xFFF3F4ED),
//       900: Color(0xFFF3F4ED),
//     }
// );