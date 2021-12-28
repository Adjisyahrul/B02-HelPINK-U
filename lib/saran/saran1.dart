import 'dart:html';

import 'package:flutter/material.dart';
import 'package:helpink_u/main.dart';
import 'package:helpink_u/saran/model.dart';
import 'package:provider/provider.dart';
import 'repo.dart';




class FormSaran extends StatefulWidget {
  const FormSaran({ Key? key }) : super(key: key);

  @override
  _FormSaranState createState() => _FormSaranState();
}

class _FormSaranState extends State<FormSaran> {

  Repo repository = Repo();
  
  

  // late String _role;
  // late String _keluhan;
  // late String _pesan;
  // late String _rating;

  String? _role;
  String? _keluhan;
  String? _pesan;
  String? _rating;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final void Fun
  //get onPressed => null;

  List<String> role=["Admin", "Donatur", "Pengaju"];
  String _roleDef="Admin";

  List<String> rate=["1", "2", "3" , "4", "5"];
  String _rateDef="5";

  //TextEditingController kontrolRole = TextEditingController();
  // TextEditingController kontrolKeluh = TextEditingController();
  // TextEditingController kontrolPesan = TextEditingController();
  //TextEditingController kontrolRate = TextEditingController();

  void kirim(){
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 100.0,

        child: Column(
          children: <Widget>[
            Text("Role    : $_role"),
            Text("Keluhan : $_keluhan"),
            Text("Pesan   : $_pesan"),
            Text("Rate    : $_rating"),
          ],
        ),
      ),
    );
    //showDialog(context: context, builder: alert);
  }

  // void _print(){
  //   showDialog(
  //       context: context, barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return new AlertDialog(
  //           kiri
  //         )
  //   }
  //   )
  // }



  void pilihRole(String value){
    setState(() {
      _roleDef=value;
    });


  }

  void pilihRate(String value){
    setState(() {
      _rateDef=value;
    });
  }

  Widget _tempatRole(){
    return Row(
      children:<Widget> [
        const Text("Role    ", style: TextStyle(fontSize: 18, color: myColor1),),
        DropdownButton(
          onChanged: (String? value){
            pilihRole(value!);
          },
          value: _roleDef,
          items: role.map((String value){
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _tempatKeluhan(){
    return TextFormField(
      //controller: kontrolKeluh,
      decoration: InputDecoration(
        hintText: "Keluhan",
        labelText: "Keluhan",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      validator: (String? value){
        if(value!=null&&value.isEmpty){
          return 'Silakan isi bagian ini';
        }
      },
      onSaved: (String? value){
        _keluhan=value!;
      },
    );


  }
  //
  Widget _tempatPesan() {
    return TextFormField(
      //controller: kontrolPesan,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: "Pesan",
        labelText: "Pesan",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return 'Silakan isi bagian ini';
        }
      },
      onSaved: (String? value) {
        _pesan = value!;
      },
    );
  }
  //
  Widget _tempatRating(){
    return Row(
      children:<Widget> [
        const Text("Rate    ", style: TextStyle(fontSize: 18, color: myColor1),),
        DropdownButton(
          onChanged: (String? value){
            pilihRate(value!);
          },
          value: _rateDef,
          items: rate.map((String value){
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  void onAdd(){
    final String roleFin = _roleDef;
    final String keluhanFin = _keluhan!;
    final String pesanFin = _pesan!;
    final String rateFin = _rateDef;

    if(roleFin.isNotEmpty&&keluhanFin.isNotEmpty&&pesanFin.isNotEmpty&&rateFin.isNotEmpty){
      final Model saran = Model(
        role: roleFin,
        keluhan: keluhanFin,
        pesan: pesanFin,
        rating: rateFin
      );
      Provider.of<Repo>(context, listen: false).tambahSaran(saran);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Form(
          key: _formKey,
          child: ListView(
            /*mainAxisAlignment: MainAxisAlignment.center,*/
            children: <Widget>[
              const Text("KRITIK DAN SARAN", style: TextStyle(color: myColor1, fontSize: 30),),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              _tempatRole(),
              const Padding(padding: EdgeInsets.only(top: 15.0)),
              _tempatKeluhan(),
              const Padding(padding: EdgeInsets.only(top: 15.0)),
              _tempatPesan(),
              const Padding(padding: EdgeInsets.only(top: 15.0)),
              _tempatRating(),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async{
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    _formKey.currentState!.save();
                    onAdd(); 
                    
                    print(_roleDef);
                    print(_keluhan);
                    print(_pesan);
                    print(_rateDef);
                    //kirim();
                  },
                  child: const Text('Submit')
              )
            ],
          )),
    );
  }
}