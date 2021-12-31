import 'package:flutter/material.dart';
import 'package:helpink_u/main.dart';
import 'carousel.dart';
import 'package:helpink_u/saran/main_form_saran.dart';
import 'package:helpink_u/pengajuan/pengajuan.dart';

class HomePengaju extends StatefulWidget {
  const HomePengaju({ Key key }) : super(key: key);

  @override
  _HomePengajuState createState() => _HomePengajuState();
}

class _HomePengajuState extends State<HomePengaju> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const CarouselHome(),
          //const Padding(padding: EdgeInsets.all(15)),
          Flexible(
            fit: FlexFit.tight,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: <Widget>[
                //1. Bantuan
                Card(
                  margin: const EdgeInsets.all(15.0),
                  color: myColor1,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return FormPengajuan();
                      }));
                    },
                    splashColor: myColor1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget> [
                          Icon(Icons.inventory_outlined, size: 70, color: myColor2,),
                          Text("Pengajuan Bantuan", style: TextStyle(fontSize: 20, color: myColor2)),
                          Text("\nAjukan apa yang Anda butuhkan", style: TextStyle(fontSize: 8, color: myColor2)),
                        ],
                      ),
                    ),
                  ),
                ),
                //2. masukkan kritik
                Card(
                  margin: const EdgeInsets.all(15.0),
                  color: myColor1,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const FormProvide();
                      }));
                    },
                    splashColor: myColor1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget> [
                          Icon(Icons.add_comment, size: 70, color: myColor2,),
                          Text("Kritik dan Saran", style: TextStyle(fontSize: 20, color: myColor2)),
                          Text("\nbantu kami perbaiki HelPINK U", style: TextStyle(fontSize: 8, color: myColor2)),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
              ),
          )
        ],
      ),
    );
  }
}