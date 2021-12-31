import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'view_donasi.dart';
import 'package:helpink_u/main.dart';

class SaranProvide extends StatelessWidget {
  const SaranProvide({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Api(),
      child: const Scaffold(
        body: TampilDonasi(),
      ),
    );
  }
}

class TampilDonasi extends StatefulWidget {
  const TampilDonasi({Key? key}) : super(key: key);
  @override
  State<TampilDonasi> createState() => _TampilDonasiState();
}

class _TampilDonasiState extends State<TampilDonasi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: const ,
      appBar: AppBar(
        title: const Text('HelPINK U'),
        
      ),
      body: const Donasi() ,//CarouselHome()HomeDonatur()HomePengaju()FormSaran()HomeAdmin()
    );
  }
}