import 'package:flutter/material.dart';
import 'api.dart';
import 'package:provider/provider.dart';
import 'formulir_donasi.dart';
import 'package:helpink_u/main.dart';

class FormulirDonasi extends StatelessWidget {
  const FormulirDonasi({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Api(),
      child: const Scaffold(
        body: TampilForm(),
      ),
    );
  }
}

class TampilForm extends StatefulWidget {
  const TampilForm({Key key}) : super(key: key);

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