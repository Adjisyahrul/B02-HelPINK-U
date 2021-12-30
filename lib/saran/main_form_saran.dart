import 'package:flutter/material.dart';

import 'saran1.dart';
import 'package:helpink_u/main.dart';



class FormTampil extends StatefulWidget {
  const FormTampil({Key? key}) : super(key: key);

  final String title='HelPINK U';

  @override
  State<FormTampil> createState() => _FormTampilState();
}

class _FormTampilState extends State<FormTampil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: myColor2)),
      ),
      body: const FormSaran() ,
      backgroundColor: myColor2
    );
  }
}

