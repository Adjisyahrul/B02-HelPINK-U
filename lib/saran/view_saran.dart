import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repo.dart';
import 'package:helpink_u/main.dart';
import 'package:provider/provider.dart';



class KritikAdmin extends StatelessWidget {
  const KritikAdmin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kritik = Provider.of<Repo>(context);
    return Container(
      //color: myColor2,
      margin: const EdgeInsets.all(24),
      child: ListView.builder(
        itemCount: kritik.saran.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(kritik.saran[index].role, style: const TextStyle(fontSize: 20, color: myColor1)),
            subtitle: Text(
              kritik.saran[index].keluhan+"\n"+
              kritik.saran[index].pesan+"\n"+
              kritik.saran[index].rating+"/5\n",
              style: const TextStyle(fontSize: 12)
              ),
            

          );
        }),
    );
  }
}