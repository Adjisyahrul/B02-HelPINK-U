import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repo.dart';
import 'package:helpink_u/main.dart';
import 'package:provider/provider.dart';



class KritikAdmin extends StatelessWidget {
  const KritikAdmin({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kritik = Provider.of<Repo>(context);
    //const Text("Kritik dan Saran");
    //const Padding(padding: EdgeInsets.only(top: 20.0));
    return Container(
      //color: myColor2,
      margin: const EdgeInsets.all(14),
      child: Column(
        children:<Widget> [
          const Text("KRITIK DAN SARAN", style: TextStyle(color: myColor1, fontSize: 30),),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: kritik.saran.length,
              //child: const Text("Kritik dan Saran"),
              itemBuilder: (BuildContext context, int index){
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(kritik.saran[index].role, style: const TextStyle(fontSize: 20, color: myColor1)),
                    subtitle: Text(
                      "\nKeluhan : "+kritik.saran[index].keluhan+"\n"+
                      "Pesan    : "+kritik.saran[index].pesan+"\n"+
                      "Rating    : "+kritik.saran[index].rating+"/5\n",
                      style: const TextStyle(fontSize: 12)
                      ),
                  ),
                );
              }),
          ),
        ],
      ),
    );
  }
}