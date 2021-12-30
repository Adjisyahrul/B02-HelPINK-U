import 'package:flutter/material.dart';

import 'view_saran.dart';
import 'package:helpink_u/main.dart';

class SaranTampil extends StatefulWidget {
  const SaranTampil({Key? key}) : super(key: key);
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

