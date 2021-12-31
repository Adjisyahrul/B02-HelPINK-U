import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repo.dart';
import 'saran1.dart';
import 'package:helpink_u/main.dart';

class FormProvide extends StatelessWidget {
  const FormProvide({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Repo(),
      child: const Scaffold(
        body: FormTampil(),
      ),
    );
  }
}

class FormTampil extends StatefulWidget {
  const FormTampil({Key key}) : super(key: key);

  //final String title='HelPINK U';

  @override
  State<FormTampil> createState() => _FormTampilState();
}

class _FormTampilState extends State<FormTampil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HelPINK U', style: const TextStyle(color: myColor2)),
      ),
      body: const FormSaran() ,
      backgroundColor: myColor2
    );
  }
}