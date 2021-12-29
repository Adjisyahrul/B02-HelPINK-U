import 'package:flutter/material.dart';
import 'package:helpink_u/saran/model.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'saran1.dart';
import 'repo.dart';
import 'view_saran.dart';
import 'package:helpink_u/home/carousel.dart';
import 'package:helpink_u/home/home_admin.dart';
import 'package:helpink_u/home/home_donatur.dart';
import 'package:helpink_u/home/home_pengaju.dart';
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

