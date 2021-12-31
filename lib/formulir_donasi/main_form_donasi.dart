import 'package:flutter/material.dart';

import 'formulir_donasi.dart';
import 'package:helpink_u/main.dart';



class TampilForm extends StatefulWidget {
  const TampilForm({Key? key}) : super(key: key);

  final String title='HelPINK U';

  @override
  State<TampilForm> createState() => TampilFormState();
}

class TampilFormState extends State<TampilForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const FormDonasi() ,
    );
  }
}