import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repo.dart';
import 'view_saran.dart';
import 'package:helpink_u/main.dart';

class SaranProvide extends StatelessWidget {
  const SaranProvide({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Repo(),
      child: const Scaffold(
        body: SaranTampil(),
      ),
    );
  }
}

class SaranTampil extends StatefulWidget {
  const SaranTampil({Key key}) : super(key: key);
  @override
  State<SaranTampil> createState() => _SaranTampilState();
}

class _SaranTampilState extends State<SaranTampil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const ,
      appBar: AppBar(
        title: const Text('HelPINK U', style: TextStyle(color: myColor2)),
        
      ),
      body: const KritikAdmin() ,//CarouselHome()HomeDonatur()HomePengaju()FormSaran()HomeAdmin()
      backgroundColor: myColor2
    );
  }
}
