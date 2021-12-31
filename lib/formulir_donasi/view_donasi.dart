import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'package:helpink_u/main.dart';
import 'package:provider/provider.dart';



class Donasi extends StatelessWidget {
  const Donasi({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dana = Provider.of<Api>(context);
    //const Text("Kritik dan Saran");
    //const Padding(padding: EdgeInsets.only(top: 20.0));
    return Container(
      //color: myColor2,
      margin: const EdgeInsets.all(14),
      child: Column(
        children:<Widget> [
          const Text("Total Donasi", style: TextStyle( fontSize: 30),),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          Flexible(
            fit: FlexFit.tight,
            child: ListView.builder(
              itemCount: dana.donasi.length,
              //child: const Text("Kritik dan Saran"),
              itemBuilder: (BuildContext context, int index){
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text("Donasi", style: const TextStyle(fontSize: 20)),
                    subtitle: Text(
                      "\nBank : "+dana.donasi[index].bank+"\n"+
                      "Nomor Rekening    : "+dana.donasi[index].norekening+"\n"+
                      "Jumlah Donasi    : "+dana.donasi[index].jmldonasi.toString()+"\n",
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