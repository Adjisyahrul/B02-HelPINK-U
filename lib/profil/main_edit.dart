import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'edit_profile.dart';
import 'package:helpink_u/main.dart';

class EditProvide extends StatelessWidget {
  const EditProvide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileAPI(),
      child: const Scaffold(
        body: AddProfile(),
      ),
    );
  }
}

class EditPengguna extends StatefulWidget {
  const EditPengguna({Key key}) : super(key: key);
  @override
  State<EditPengguna> createState() => _EditPenggunaState();
}

class _EditPenggunaState extends State<EditPengguna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: const ,
        appBar: AppBar(
          title: const Text('HelPINK U', style: TextStyle(color: myColor2)),
        ),
        body:
            const AddProfile(), //CarouselHome()HomeDonatur()HomePengaju()FormSaran()HomeAdmin()
        backgroundColor: myColor2);
  }
}
