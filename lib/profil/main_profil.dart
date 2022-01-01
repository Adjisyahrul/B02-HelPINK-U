import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'profile_page.dart';
import 'package:helpink_u/main.dart';

class ProfilProvide extends StatelessWidget {
  const ProfilProvide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileAPI(),
      child: const Scaffold(
        body: ProfilPengguna(),
      ),
    );
  }
}

class ProfilPengguna extends StatefulWidget {
  const ProfilPengguna({Key key}) : super(key: key);
  @override
  State<ProfilPengguna> createState() => _ProfilPenggunaState();
}

class _ProfilPenggunaState extends State<ProfilPengguna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: const ,
        appBar: AppBar(
          title: const Text('HelPINK U', style: TextStyle(color: myColor2)),
        ),
        body:
            const UserProfile(), //CarouselHome()HomeDonatur()HomePengaju()FormSaran()HomeAdmin()
        backgroundColor: myColor2);
  }
}
